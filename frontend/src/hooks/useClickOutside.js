import { useEffect } from "react";

/**
 * Calls onClickOutside when a click/touch happens outside every ref in refs.
 * Pass an array of refs so multiple related elements (trigger + panel) can
 * be treated as one "inside" region.
 */
export const useClickOutside = (refs, onClickOutside, isActive = true) => {
  useEffect(() => {
    if (!isActive) return undefined;

    const handlePointerDown = (event) => {
      const clickedInside = refs.some(
        (ref) => ref.current && ref.current.contains(event.target)
      );
      if (!clickedInside) onClickOutside();
    };

    document.addEventListener("mousedown", handlePointerDown);
    document.addEventListener("touchstart", handlePointerDown);

    return () => {
      document.removeEventListener("mousedown", handlePointerDown);
      document.removeEventListener("touchstart", handlePointerDown);
    };
  }, [refs, onClickOutside, isActive]);
};