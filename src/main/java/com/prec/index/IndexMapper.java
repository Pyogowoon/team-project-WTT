package com.prec.index;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
@Qualifier("indexMapper")
public interface IndexMapper {

}
