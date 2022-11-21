package com.woo.infra.modules.chat;

import java.util.List;

public interface ChatService {
	
	public List<Chat> selectChatListFromOne(Integer seq) throws Exception;

}
