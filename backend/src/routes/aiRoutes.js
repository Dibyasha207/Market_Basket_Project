const express = require("express");
const router = express.Router();
const {
  chat,
  getConversations,
  getConversationMessages,
  getKnowledgeSources,
} = require("../controllers/aiController");

router.post("/chat", chat);
router.get("/conversations", getConversations);
router.get("/conversations/:id/messages", getConversationMessages);
router.get("/knowledge-sources", getKnowledgeSources);

module.exports = router;
