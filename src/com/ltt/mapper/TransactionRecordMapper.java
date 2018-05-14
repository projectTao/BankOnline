package com.ltt.mapper;

import com.ltt.model.TransactionRecord;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TransactionRecordMapper {

    int deleteByPrimaryKey(Long id);

    int insert(TransactionRecord transactionRecord);

    int insertSelective(TransactionRecord transactionRecord);

    TransactionRecord selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TransactionRecord transactionRecord);

    int updateByPrimaryKey(TransactionRecord transactionRecord);


    List<TransactionRecord> listAll(@Param("startDate") String startDate, @Param("endDate") String endDate);
}
