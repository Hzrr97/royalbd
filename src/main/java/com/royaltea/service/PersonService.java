package com.royaltea.service;

import java.util.List;

import com.royaltea.pojo.Person;

public interface PersonService {

    /**
     * 加载全部的person
     * @return
     */
    List<Person> loadPersons();
}
