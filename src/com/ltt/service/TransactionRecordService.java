package com.ltt.service;

import com.github.pagehelper.PageInfo;
import com.ltt.dto.PagesDto;
import com.ltt.model.TransactionRecord;

public interface TransactionRecordService {

    int outInsert(TransactionRecord transactionRecord);

    PageInfo<TransactionRecord> listPage(PagesDto dto);
}
