const aiService = require("../services/aiService");

const chat = async (req, res) => {
  try {
    const { message, conversationId } = req.body;
    if (!message || !message.trim()) {
      return res.status(400).json({ success: false, message: "Message is required" });
    }

    const adminId = req.admin?.id || 1;
    const result = await aiService.handleChat(message, conversationId, adminId);

    res.status(200).json({
      success: true,
      data: result,
    });
  } catch (error) {
    console.error("AI chat error:", error);
    res.status(500).json({
      success: false,
      message: error.message || "Failed to generate AI response",
    });
  }
};

const getConversations = async (req, res) => {
  try {
    const adminId = req.admin?.id || 1;
    const conversations = await aiService.getConversations(adminId);
    res.status(200).json({
      success: true,
      count: conversations.length,
      data: conversations,
    });
  } catch (error) {
    console.error("getConversations error:", error);
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};

const getConversationMessages = async (req, res) => {
  try {
    const { id } = req.params;
    const messages = await aiService.getConversationMessages(id);
    res.status(200).json({
      success: true,
      count: messages.length,
      data: messages,
    });
  } catch (error) {
    console.error("getConversationMessages error:", error);
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};

const getKnowledgeSources = (req, res) => {
  const sources = aiService.getKnowledgeSources();
  res.status(200).json({
    success: true,
    data: sources,
  });
};

module.exports = {
  chat,
  getConversations,
  getConversationMessages,
  getKnowledgeSources,
};
