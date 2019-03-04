package com.royaltea.service.impl;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class EmpAspect {
	
	@Before(value="execution(* *.loadEmp())")
	void hello(){
		System.out.println("hello");
	}
}
