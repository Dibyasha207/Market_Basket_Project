import  { useState, useRef, useEffect } from "react";
import { AnimatePresence, motion } from "framer-motion";
import { BotMessageSquare, X, Send, Loader2, Sparkles } from "lucide-react";
import { sendAssistantMessage } from "../../services/forecastService";

const AIChatWidget = () => {
  const [isOpen, setIsOpen] = useState(false);
  const [messages, setMessages] = useState([
    { role: "assistant", text: "Hi! Ask me anything about your retail data — sales, forecasts, or customer trends." },
  ]);
  const [input, setInput] = useState("");
  const [isSending, setIsSending] = useState(false);
  const scrollRef = useRef(null);

  useEffect(() => {
    scrollRef.current?.scrollTo({ top: scrollRef.current.scrollHeight, behavior: "smooth" });
  }, [messages, isOpen]);

  const handleSend = async () => {
    const trimmed = input.trim();
    if (!trimmed || isSending) return;

    setMessages((prev) => [...prev, { role: "user", text: trimmed }]);
    setInput("");
    setIsSending(true);

    try {
      const data = await sendAssistantMessage(trimmed);
      setMessages((prev) => [...prev, { role: "assistant", text: data.reply ?? data.message ?? "Here's what I found." }]);
    } catch (err) {
      console.error("Assistant request failed:", err);
      setMessages((prev) => [...prev, { role: "assistant", text: "Sorry, I couldn't process that right now." }]);
    } finally {
      setIsSending(false);
    }
  };

  const handleKeyDown = (e) => {
    if (e.key === "Enter" && !e.shiftKey) {
      e.preventDefault();
      handleSend();
    }
  };

  return (
    <>
      <AnimatePresence>
        {isOpen && (
          <motion.div
            initial={{ opacity: 0, y: 20, scale: 0.95 }}
            animate={{ opacity: 1, y: 0, scale: 1 }}
            exit={{ opacity: 0, y: 20, scale: 0.95 }}
            transition={{ duration: 0.2 }}
            className="fixed bottom-24 right-6 z-50 w-[22rem] h-[30rem] rounded-2xl bg-white border border-slate-200 shadow-2xl shadow-indigo-500/20 flex flex-col overflow-hidden"
          >
            <div className="flex items-center justify-between px-5 py-4 bg-gradient-to-r from-indigo-600 to-violet-600 text-white">
              <div className="flex items-center gap-2.5">
                <Sparkles className="w-4.5 h-4.5" />
                <span className="text-sm font-bold">AI Business Assistant</span>
              </div>
              <button onClick={() => setIsOpen(false)} className="p-1 rounded-lg hover:bg-white/15 transition-colors">
                <X className="w-4 h-4" />
              </button>
            </div>

            <div ref={scrollRef} className="flex-1 overflow-y-auto px-4 py-4 space-y-3">
              {messages.map((msg, i) => (
                <div key={i} className={`flex ${msg.role === "user" ? "justify-end" : "justify-start"}`}>
                  <div
                    className={`max-w-[80%] px-3.5 py-2.5 rounded-2xl text-sm leading-relaxed ${
                      msg.role === "user"
                        ? "bg-gradient-to-r from-indigo-600 to-violet-600 text-white rounded-br-sm"
                        : "bg-slate-100 text-slate-700 rounded-bl-sm"
                    }`}
                  >
                    {msg.text}
                  </div>
                </div>
              ))}
              {isSending && (
                <div className="flex justify-start">
                  <div className="px-3.5 py-2.5 rounded-2xl rounded-bl-sm bg-slate-100 flex items-center gap-1.5">
                    <Loader2 className="w-3.5 h-3.5 animate-spin text-slate-400" />
                    <span className="text-xs text-slate-400">Thinking...</span>
                  </div>
                </div>
              )}
            </div>

            <div className="p-3 border-t border-slate-100 flex items-center gap-2">
              <input
                value={input}
                onChange={(e) => setInput(e.target.value)}
                onKeyDown={handleKeyDown}
                placeholder="Ask about your business..."
                className="flex-1 px-3.5 py-2.5 rounded-xl border border-slate-200 text-sm outline-none focus:border-indigo-300 focus:ring-4 focus:ring-indigo-100 transition-all"
              />
              <button
                onClick={handleSend}
                disabled={isSending || !input.trim()}
                className="w-10 h-10 rounded-xl bg-gradient-to-r from-indigo-600 to-violet-600 text-white flex items-center justify-center shrink-0 disabled:opacity-50 transition-opacity"
              >
                <Send className="w-4 h-4" />
              </button>
            </div>
          </motion.div>
        )}
      </AnimatePresence>

      <motion.button
        onClick={() => setIsOpen((v) => !v)}
        whileHover={{ scale: 1.06 }}
        whileTap={{ scale: 0.96 }}
        className="fixed bottom-6 right-6 z-50 w-14 h-14 rounded-2xl bg-gradient-to-br from-indigo-600 to-violet-600 text-white shadow-xl shadow-indigo-500/30 flex items-center justify-center"
        aria-label="Open AI Assistant"
      >
        {isOpen ? <X className="w-6 h-6" /> : <BotMessageSquare className="w-6 h-6" />}
      </motion.button>
    </>
  );
};

export default AIChatWidget;