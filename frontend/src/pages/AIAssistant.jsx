import { useState, useEffect, useRef } from "react";
import { motion } from "framer-motion";
import {
  Sparkles,
  Send,
  Plus,
  Download,
  Database,
  Layers,
  TrendingUp,
  Package,
  CheckCircle2,
  ThumbsUp,
  Copy,
  Check,
  Bot,
  User,
  Clock,
  ExternalLink,
  ChevronRight,
  AlertCircle,
  RotateCcw,
} from "lucide-react";
import aiService from "../services/aiService";

const SUGGESTED_PROMPTS = [
  "Which products should be promoted together?",
  "Who are our top customer segments by revenue?",
  "What is our 7-day sales revenue projection?",
  "Which products are currently low on stock?",
  "What are the top 5 revenue-generating items?",
];

const AIAssistant = () => {
  const [messages, setMessages] = useState([]);
  const [inputValue, setInputValue] = useState("");
  const [isLoading, setIsLoading] = useState(false);
  const [conversationId, setConversationId] = useState(null);
  const [conversations, setConversations] = useState([]);
  const [knowledgeSources, setKnowledgeSources] = useState([
    { id: 1, name: "Market Basket Analysis Rules", count: "76 Rules", status: "Active" },
    { id: 2, name: "Customer RFM Segments", count: "4,338 Segments", status: "Active" },
    { id: 3, name: "Sales & Orders Database", count: "PostgreSQL Live", status: "Active" },
    { id: 4, name: "Prophet Forecast Model", count: "Prophet v1.0", status: "Active" },
  ]);
  const [copiedIdx, setCopiedIdx] = useState(null);
  const [likedIdx, setLikedIdx] = useState({});

  const messagesEndRef = useRef(null);

  useEffect(() => {
    loadInitialData();
  }, []);

  useEffect(() => {
    messagesEndRef.current?.scrollIntoView({ behavior: "smooth" });
  }, [messages, isLoading]);

  const loadInitialData = async () => {
    try {
      const [convRes, sourcesRes] = await Promise.allSettled([
        aiService.getAIConversations(),
        aiService.getAIKnowledgeSources(),
      ]);

      if (convRes.status === "fulfilled" && convRes.value?.data) {
        setConversations(convRes.value.data);
      }
      if (sourcesRes.status === "fulfilled" && sourcesRes.value?.data) {
        setKnowledgeSources(sourcesRes.value.data);
      }
    } catch (err) {
      console.warn("Could not load initial AI assistant data:", err);
    }
  };

  const handleSendMessage = async (textToSend) => {
    const query = textToSend || inputValue;
    if (!query.trim() || isLoading) return;

    const userMessage = {
      role: "user",
      content: query,
      timestamp: new Date().toLocaleTimeString([], { hour: "2-digit", minute: "2-digit" }),
    };

    setMessages((prev) => [...prev, userMessage]);
    setInputValue("");
    setIsLoading(true);

    try {
      const res = await aiService.sendAIMessage(query, conversationId);
      if (res?.success && res?.data) {
        const payload = res.data;
        if (payload.conversationId && !conversationId) {
          setConversationId(payload.conversationId);
          loadInitialData();
        }

        const aiMessage = {
          role: "assistant",
          content: payload.response?.message || "Analysis complete based on database records.",
          table: payload.response?.table || null,
          keyInsight: payload.response?.keyInsight || null,
          recommendations: payload.response?.recommendations || [],
          sources: payload.sources || ["PostgreSQL retail_intelligence"],
          responseTimeMs: payload.responseTimeMs || 240,
          timestamp: new Date().toLocaleTimeString([], { hour: "2-digit", minute: "2-digit" }),
        };

        setMessages((prev) => [...prev, aiMessage]);
      }
    } catch (err) {
      console.error("AI Assistant error:", err);
      setMessages((prev) => [
        ...prev,
        {
          role: "assistant",
          content: "I encountered an error retrieving data from the retail database. Please try again or refine your query.",
          timestamp: new Date().toLocaleTimeString([], { hour: "2-digit", minute: "2-digit" }),
        },
      ]);
    } finally {
      setIsLoading(false);
    }
  };

  const handleNewConversation = () => {
    setMessages([]);
    setConversationId(null);
  };

  const handleSelectConversation = async (conv) => {
    try {
      setConversationId(conv.conversation_id);
      const res = await aiService.getAIConversationMessages(conv.conversation_id);
      if (res?.success && Array.isArray(res.data)) {
        const mapped = res.data.map((m) => ({
          role: m.sender === "User" ? "user" : "assistant",
          content: m.message,
          timestamp: new Date(m.created_at).toLocaleTimeString([], { hour: "2-digit", minute: "2-digit" }),
        }));
        setMessages(mapped);
      }
    } catch (err) {
      console.error("Failed to load conversation messages:", err);
    }
  };

  const handleCopy = (text, idx) => {
    navigator.clipboard.writeText(text);
    setCopiedIdx(idx);
    setTimeout(() => setCopiedIdx(null), 2000);
  };

  const handleLike = (idx) => {
    setLikedIdx((prev) => ({ ...prev, [idx]: !prev[idx] }));
  };

  const exportChat = () => {
    const transcript = messages
      .map((m) => `[${m.timestamp}] ${m.role.toUpperCase()}: ${m.content}`)
      .join("\n\n");
    const blob = new Blob([transcript], { type: "text/plain" });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = `ai_assistant_chat_${Date.now()}.txt`;
    a.click();
  };

  return (
    <div className="space-y-6">
      {/* Page Header */}
      <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
        <div>
          <div className="flex items-center gap-2.5">
            <h1 className="text-2xl sm:text-3xl font-extrabold text-slate-900 dark:text-slate-100 tracking-tight">
              AI Assistant
            </h1>
            <span className="px-2.5 py-0.5 rounded-full text-xs font-semibold bg-purple-100 dark:bg-purple-950/80 text-purple-700 dark:text-purple-400 border border-purple-300 dark:border-purple-800">
              RAG + PostgreSQL
            </span>
          </div>
          <p className="mt-1 text-sm text-slate-500 dark:text-slate-400">
            Ask questions, generate retail insights, and get instant answers grounded in your business data
          </p>
        </div>

        <div className="flex items-center gap-2.5">
          <button
            onClick={handleNewConversation}
            className="inline-flex items-center gap-2 px-3.5 py-2 rounded-xl text-xs font-semibold bg-indigo-600 hover:bg-indigo-700 text-white shadow-sm transition-all"
          >
            <Plus className="w-4 h-4" />
            New Conversation
          </button>
          {messages.length > 0 && (
            <button
              onClick={exportChat}
              className="inline-flex items-center gap-2 px-3.5 py-2 rounded-xl text-xs font-semibold bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-slate-700 dark:text-slate-200 hover:bg-slate-50 dark:hover:bg-slate-700 transition-colors shadow-sm"
            >
              <Download className="w-4 h-4" />
              Export Chat
            </button>
          )}
        </div>
      </div>

      {/* 2-Column Layout */}
      <div className="grid grid-cols-1 lg:grid-cols-12 gap-6 items-start">
        {/* Main Chat Canvas (8 cols) */}
        <div className="lg:col-span-8 flex flex-col h-[740px] rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700/60 shadow-sm overflow-hidden">
          {/* Messages Area */}
          <div className="flex-1 overflow-y-auto p-4 sm:p-6 space-y-6">
            {messages.length === 0 ? (
              <div className="h-full flex flex-col justify-center items-center text-center max-w-xl mx-auto py-8">
                <div className="w-16 h-16 rounded-2xl bg-gradient-to-tr from-indigo-600 to-purple-600 text-white flex items-center justify-center shadow-xl shadow-indigo-500/20 mb-4">
                  <Bot className="w-8 h-8" />
                </div>
                <h3 className="text-xl font-bold text-slate-900 dark:text-slate-100 tracking-tight">
                  Retail Intelligence AI Assistant
                </h3>
                <p className="mt-2 text-xs sm:text-sm text-slate-500 dark:text-slate-400 leading-relaxed">
                  I am connected directly to your PostgreSQL database. I can analyze 76 association rules, 4,338 customer segments, sales forecasts, and inventory alerts in real time.
                </p>

                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 mt-8 w-full text-left">
                  {SUGGESTED_PROMPTS.slice(0, 4).map((prompt, idx) => (
                    <button
                      key={idx}
                      onClick={() => handleSendMessage(prompt)}
                      className="p-3.5 rounded-xl border border-slate-200/80 dark:border-slate-700 bg-slate-50/70 dark:bg-slate-900/60 hover:border-indigo-400 dark:hover:border-indigo-500/60 hover:bg-indigo-50/40 dark:hover:bg-slate-700/40 text-left transition-all group"
                    >
                      <div className="flex items-center justify-between">
                        <span className="text-xs font-semibold text-slate-800 dark:text-slate-200 group-hover:text-indigo-600 dark:group-hover:text-indigo-400">
                          {prompt}
                        </span>
                        <ChevronRight className="w-3.5 h-3.5 text-slate-400 group-hover:text-indigo-500 group-hover:translate-x-0.5 transition-all" />
                      </div>
                    </button>
                  ))}
                </div>
              </div>
            ) : (
              messages.map((msg, idx) => (
                <motion.div
                  key={idx}
                  initial={{ opacity: 0, y: 10 }}
                  animate={{ opacity: 1, y: 0 }}
                  transition={{ duration: 0.2 }}
                  className={`flex gap-3 ${msg.role === "user" ? "justify-end" : "justify-start"}`}
                >
                  {msg.role === "assistant" && (
                    <div className="w-8 h-8 rounded-xl bg-gradient-to-tr from-indigo-600 to-purple-600 text-white flex items-center justify-center flex-shrink-0 shadow-sm mt-0.5">
                      <Sparkles className="w-4 h-4" />
                    </div>
                  )}

                  <div
                    className={`max-w-[85%] rounded-2xl p-4 sm:p-5 text-xs sm:text-sm leading-relaxed ${
                      msg.role === "user"
                        ? "bg-indigo-600 text-white rounded-tr-none shadow-md shadow-indigo-600/10"
                        : "bg-slate-50 dark:bg-slate-900/90 border border-slate-200/80 dark:border-slate-700/70 text-slate-800 dark:text-slate-100 rounded-tl-none shadow-sm"
                    }`}
                  >
                    <p className="whitespace-pre-line">{msg.content}</p>

                    {/* Table if present in assistant response */}
                    {msg.table && (
                      <div className="mt-4 overflow-x-auto rounded-xl border border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-800 shadow-sm">
                        <div className="px-3 py-2 bg-slate-100 dark:bg-slate-700/60 font-semibold text-xs text-slate-700 dark:text-slate-300 border-b border-slate-200 dark:border-slate-700">
                          {msg.table.title || "Data Analysis Results"}
                        </div>
                        <table className="w-full text-xs text-left">
                          <thead className="bg-slate-50 dark:bg-slate-900/60 text-slate-500 dark:text-slate-400 font-semibold border-b border-slate-200 dark:border-slate-700">
                            <tr>
                              {msg.table.columns?.map((col, cIdx) => (
                                <th key={cIdx} className="py-2 px-3">{col}</th>
                              ))}
                            </tr>
                          </thead>
                          <tbody className="divide-y divide-slate-100 dark:divide-slate-700/60">
                            {msg.table.rows?.map((row, rIdx) => (
                              <tr key={rIdx} className="hover:bg-slate-50/80 dark:hover:bg-slate-700/40">
                                {Object.values(row).map((val, vIdx) => (
                                  <td key={vIdx} className="py-2.5 px-3 font-mono">
                                    {String(val)}
                                  </td>
                                ))}
                              </tr>
                            ))}
                          </tbody>
                        </table>
                      </div>
                    )}

                    {/* Key Insight Card */}
                    {msg.keyInsight && (
                      <div className="mt-3.5 p-3 rounded-xl bg-purple-50 dark:bg-purple-950/50 border border-purple-200 dark:border-purple-800/60 text-purple-900 dark:text-purple-300 text-xs">
                        <span className="font-bold flex items-center gap-1.5 mb-1">
                          <Sparkles className="w-3.5 h-3.5 text-purple-600 dark:text-purple-400" />
                          Key Insight:
                        </span>
                        <span>{msg.keyInsight}</span>
                      </div>
                    )}

                    {/* Recommendations List */}
                    {msg.recommendations && msg.recommendations.length > 0 && (
                      <div className="mt-3 space-y-1.5">
                        <span className="font-semibold text-xs text-slate-700 dark:text-slate-300">
                          Recommended Actions:
                        </span>
                        {msg.recommendations.map((rec, rIdx) => (
                          <div key={rIdx} className="flex items-start gap-2 text-xs text-slate-600 dark:text-slate-400">
                            <CheckCircle2 className="w-3.5 h-3.5 text-emerald-500 mt-0.5 flex-shrink-0" />
                            <span>{rec}</span>
                          </div>
                        ))}
                      </div>
                    )}

                    {/* Footer / Meta info for assistant */}
                    {msg.role === "assistant" && (
                      <div className="mt-4 pt-3 border-t border-slate-200/60 dark:border-slate-700/60 flex flex-wrap items-center justify-between gap-2 text-[11px] text-slate-500 dark:text-slate-400">
                        <div className="flex items-center gap-2">
                          <span className="flex items-center gap-1">
                            <Clock className="w-3 h-3" />
                            {msg.responseTimeMs ? `${msg.responseTimeMs}ms` : msg.timestamp}
                          </span>
                          {msg.sources && (
                            <span className="px-2 py-0.5 rounded-md bg-slate-200/70 dark:bg-slate-700/70 text-slate-600 dark:text-slate-300">
                              {msg.sources[0]?.replace("_", " ") || "Database"}
                            </span>
                          )}
                        </div>

                        <div className="flex items-center gap-2">
                          <button
                            onClick={() => handleCopy(msg.content, idx)}
                            className="p-1 rounded hover:bg-slate-200 dark:hover:bg-slate-700 transition-colors"
                            title="Copy response"
                          >
                            {copiedIdx === idx ? (
                              <Check className="w-3.5 h-3.5 text-emerald-500" />
                            ) : (
                              <Copy className="w-3.5 h-3.5" />
                            )}
                          </button>
                          <button
                            onClick={() => handleLike(idx)}
                            className={`p-1 rounded hover:bg-slate-200 dark:hover:bg-slate-700 transition-colors ${
                              likedIdx[idx] ? "text-indigo-600 dark:text-indigo-400" : ""
                            }`}
                            title="Helpful"
                          >
                            <ThumbsUp className="w-3.5 h-3.5" />
                          </button>
                        </div>
                      </div>
                    )}
                  </div>

                  {msg.role === "user" && (
                    <div className="w-8 h-8 rounded-xl bg-slate-200 dark:bg-slate-700 text-slate-700 dark:text-slate-200 flex items-center justify-center flex-shrink-0 mt-0.5">
                      <User className="w-4 h-4" />
                    </div>
                  )}
                </motion.div>
              ))
            )}

            {isLoading && (
              <motion.div
                initial={{ opacity: 0, y: 10 }}
                animate={{ opacity: 1, y: 0 }}
                className="flex items-center gap-3"
              >
                <div className="w-8 h-8 rounded-xl bg-gradient-to-tr from-indigo-600 to-purple-600 text-white flex items-center justify-center flex-shrink-0 shadow-sm">
                  <Sparkles className="w-4 h-4 animate-spin" />
                </div>
                <div className="p-3.5 rounded-2xl bg-slate-50 dark:bg-slate-900 border border-slate-200/80 dark:border-slate-700 text-xs text-slate-500 dark:text-slate-400 flex items-center gap-2">
                  <div className="w-2 h-2 rounded-full bg-indigo-500 animate-pulse"></div>
                  <span>Querying PostgreSQL database and computing grounded response...</span>
                </div>
              </motion.div>
            )}

            <div ref={messagesEndRef} />
          </div>

          {/* Bottom Suggestion Chips */}
          <div className="px-4 pt-2 pb-1 border-t border-slate-100 dark:border-slate-700/50 bg-slate-50/50 dark:bg-slate-900/30 overflow-x-auto">
            <div className="flex items-center gap-2 whitespace-nowrap py-1">
              <span className="text-[11px] font-semibold text-slate-500 dark:text-slate-400 flex items-center gap-1 flex-shrink-0">
                <Sparkles className="w-3 h-3 text-indigo-500" /> Prompts:
              </span>
              {SUGGESTED_PROMPTS.map((p, idx) => (
                <button
                  key={idx}
                  onClick={() => handleSendMessage(p)}
                  className="px-2.5 py-1 rounded-full text-xs bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 text-slate-600 dark:text-slate-300 hover:border-indigo-300 dark:hover:border-indigo-500 hover:text-indigo-600 dark:hover:text-indigo-400 transition-colors shadow-2xs"
                >
                  {p}
                </button>
              ))}
            </div>
          </div>

          {/* Bottom Input Field */}
          <div className="p-4 border-t border-slate-200 dark:border-slate-700 bg-white dark:bg-slate-800">
            <form
              onSubmit={(e) => {
                e.preventDefault();
                handleSendMessage();
              }}
              className="flex items-center gap-2"
            >
              <input
                type="text"
                value={inputValue}
                onChange={(e) => setInputValue(e.target.value)}
                placeholder="Ask about top selling products, association rules, customer RFM, or sales forecasts..."
                className="flex-1 px-4 py-3 rounded-xl bg-slate-50 dark:bg-slate-900 border border-slate-200 dark:border-slate-700 text-xs sm:text-sm text-slate-800 dark:text-slate-100 placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-500 transition-all"
              />
              <button
                type="submit"
                disabled={!inputValue.trim() || isLoading}
                className="p-3 rounded-xl bg-indigo-600 hover:bg-indigo-700 text-white shadow-sm transition-all disabled:opacity-50 disabled:cursor-not-allowed flex-shrink-0"
              >
                <Send className="w-4 h-4" />
              </button>
            </form>
            <p className="mt-2 text-[11px] text-center text-slate-500 dark:text-slate-400">
              Responses are computed directly from live PostgreSQL database records and machine learning models.
            </p>
          </div>
        </div>

        {/* Right Sidebar (4 cols) */}
        <div className="lg:col-span-4 space-y-6">
          {/* Knowledge Sources Card */}
          <div className="p-5 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700/60 shadow-sm">
            <div className="flex items-center gap-2 mb-4">
              <Database className="w-4 h-4 text-indigo-600 dark:text-indigo-400" />
              <h2 className="text-sm font-bold text-slate-900 dark:text-slate-100">Knowledge Sources</h2>
            </div>
            <div className="space-y-3 text-xs">
              {knowledgeSources.map((source) => (
                <div
                  key={source.id}
                  className="p-3 rounded-xl bg-slate-50 dark:bg-slate-900/60 border border-slate-200/60 dark:border-slate-700/60 flex items-center justify-between"
                >
                  <div>
                    <p className="font-semibold text-slate-800 dark:text-slate-200">{source.name}</p>
                    <p className="text-[11px] text-slate-500 dark:text-slate-400 mt-0.5">{source.count || source.lastUpdated}</p>
                  </div>
                  <span className="inline-flex items-center gap-1.5 px-2 py-0.5 rounded-full text-[11px] font-semibold bg-emerald-50 dark:bg-emerald-950 text-emerald-600 dark:text-emerald-400 border border-emerald-200 dark:border-emerald-800">
                    <span className="w-1.5 h-1.5 rounded-full bg-emerald-500"></span>
                    {source.status}
                  </span>
                </div>
              ))}
            </div>
          </div>

          {/* Suggested Questions Card */}
          <div className="p-5 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700/60 shadow-sm">
            <div className="flex items-center gap-2 mb-4">
              <Sparkles className="w-4 h-4 text-purple-600 dark:text-purple-400" />
              <h2 className="text-sm font-bold text-slate-900 dark:text-slate-100">Suggested Inquiries</h2>
            </div>
            <div className="space-y-2">
              {[
                "Which customer segments generate the highest CLV?",
                "What products have association lift greater than 2.0?",
                "Summarize overall revenue growth for the coming week.",
                "List out-of-stock items needing immediate reorder.",
              ].map((q, idx) => (
                <button
                  key={idx}
                  onClick={() => handleSendMessage(q)}
                  className="w-full text-left p-2.5 rounded-xl text-xs text-slate-700 dark:text-slate-300 hover:bg-indigo-50 dark:hover:bg-slate-700/50 hover:text-indigo-600 dark:hover:text-indigo-400 transition-colors flex items-center justify-between group"
                >
                  <span>{q}</span>
                  <ChevronRight className="w-3.5 h-3.5 text-slate-400 group-hover:text-indigo-500 group-hover:translate-x-0.5 transition-all flex-shrink-0 ml-2" />
                </button>
              ))}
            </div>
          </div>

          {/* Recent Conversations */}
          {conversations.length > 0 && (
            <div className="p-5 rounded-2xl bg-white dark:bg-slate-800 border border-slate-200/80 dark:border-slate-700/60 shadow-sm">
              <div className="flex items-center justify-between mb-4">
                <div className="flex items-center gap-2">
                  <Clock className="w-4 h-4 text-slate-500 dark:text-slate-400" />
                  <h2 className="text-sm font-bold text-slate-900 dark:text-slate-100">Recent Chats</h2>
                </div>
                <button
                  onClick={handleNewConversation}
                  className="text-xs text-indigo-600 dark:text-indigo-400 hover:underline font-semibold"
                >
                  Clear
                </button>
              </div>
              <div className="space-y-1.5 max-h-48 overflow-y-auto pr-1">
                {conversations.map((conv) => (
                  <button
                    key={conv.conversation_id}
                    onClick={() => handleSelectConversation(conv)}
                    className={`w-full text-left p-2.5 rounded-xl text-xs transition-colors flex items-center justify-between ${
                      conversationId === conv.conversation_id
                        ? "bg-indigo-50 dark:bg-indigo-950/50 text-indigo-600 dark:text-indigo-400 font-semibold"
                        : "text-slate-600 dark:text-slate-400 hover:bg-slate-50 dark:hover:bg-slate-700/40"
                    }`}
                  >
                    <span className="truncate pr-2">{conv.title || `Conversation #${conv.conversation_id}`}</span>
                    <span className="text-[10px] text-slate-400 flex-shrink-0">
                      {new Date(conv.created_at).toLocaleDateString([], { month: "short", day: "numeric" })}
                    </span>
                  </button>
                ))}
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default AIAssistant;