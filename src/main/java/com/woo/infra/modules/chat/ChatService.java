package com.woo.infra.modules.chat;

import java.util.List;

public interface ChatService {
	
	public List<Chat> selectChatListFromOne(Integer seq) throws Exception;
	public Chat createChat(int chatUserA, int chatUserB) throws Exception;
	
	public int selectOneChatCount(Chat dto) throws Exception;
}
