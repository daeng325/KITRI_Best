package com.kitri.shop.logback;

import com.fasterxml.jackson.core.JsonGenerator;
import net.logstash.logback.decorate.JsonGeneratorDecorator;

/**
 * 로그를 JSON으로 출력하기 위한 데코레이터
 */
public class PrettyPrintingDecorator implements JsonGeneratorDecorator {

    @Override
    public JsonGenerator decorate(JsonGenerator generator) {

        return generator.useDefaultPrettyPrinter();
    }
}
