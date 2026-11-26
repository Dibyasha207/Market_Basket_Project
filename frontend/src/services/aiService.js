import api from "./api";

export const sendAIMessage = async (message, conversationId = null) => {
  const { data } = await api.post("/ai/chat", { message, conversationId });
  return data;
};

export const getAIConversations = async () => {
  const { data } = await api.get("/ai/conversations");
  return data;
};

export const getAIConversationMessages = async (conversationId) => {
  const { data } = await api.get(`/ai/conversations/${conversationId}/messages`);
  return data;
};

export const getAIKnowledgeSources = async () => {
  const { data } = await api.get("/ai/knowledge-sources");
  return data;
};

const aiService = {
  sendAIMessage,
  getAIConversations,
  getAIConversationMessages,
  getAIKnowledgeSources,
};

export default aiService;
