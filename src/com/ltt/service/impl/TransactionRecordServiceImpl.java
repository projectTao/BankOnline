package com.ltt.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ltt.dto.PagesDto;
import com.ltt.mapper.TransactionRecordMapper;
import com.ltt.model.TransactionRecord;
import com.ltt.service.TransactionRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("TransactionRecordService")
public class TransactionRecordServiceImpl implements TransactionRecordService {

    @Autowired
    private TransactionRecordMapper transactionRecordMapper;


    @Override
    public int outInsert(TransactionRecord transactionRecord) {
        int row = transactionRecordMapper.insertSelective(transactionRecord);
        if (row == 1){
            return row;
        }
        return row;
    }

    @Override
    public PageInfo<TransactionRecord> listPage(PagesDto dto) {
        PageHelper.startPage(dto.getPageNum(),dto.getPageSize());
        List<TransactionRecord> list = transactionRecordMapper.listAll(dto.getStartDateForm(),dto.getEndDateForm());
        PageInfo<TransactionRecord> pageInfo = new PageInfo<TransactionRecord>(list);
        pageInfo.setList(list);
        return pageInfo;
    }
}
