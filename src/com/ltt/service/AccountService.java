package com.ltt.service;

import com.ltt.dto.TransferDto;
import com.ltt.model.Account;

public interface AccountService {

    Account login(Account account);

    boolean isExists(String cardNo);

    boolean isDisable(String cardNo);

    Account selBalance(String cardNo);

    int updateBalance(TransferDto transferDto);

    boolean selPassword(String cardNo, String newPassword);

    int updatePassword(String cardNo, String newPassword);
}
