package com.ltt.mapper;

import com.ltt.model.Account;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountMapper {

    int insert(Account account);

    int insertSelective(Account account);

    Account login(Account account);

    int isExists(@Param("cardNo") String cardNo);

    int isDisable(@Param("cardNo")String cardNo);

    Account selBalance(@Param("cardNo") String cardNo);

    int updateBalanceRecord(@Param("cardNo") String cardNo, @Param("balance") double balance);

    Account selPassword(@Param("cardNo") String cardNo);

    int updatePassword(@Param("cardNo")String cardNo, @Param("password") String password);
}
