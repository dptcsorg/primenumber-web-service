package com.deep.prime.controller;

import com.deep.prime.services.PrimeAlgo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.util.List;

@Controller
public class PrimeController {

    @Autowired
    PrimeAlgo sieveOfEratosthenes;

    @GetMapping(value="/prime/{number}", produces={"application/json","application/xml"})
    @ResponseStatus(HttpStatus.OK)
    public @ResponseBody List<Integer> getBook(@PathVariable int number) {
        return (sieveOfEratosthenes.getPrimes(number));
    }
}
