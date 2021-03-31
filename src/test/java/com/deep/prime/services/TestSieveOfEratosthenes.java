package com.deep.prime.services;

import org.junit.jupiter.api.Test;
import java.util.Arrays;
import static org.junit.jupiter.api.Assertions.assertEquals;


public class TestSieveOfEratosthenes {

    @Test
    public void sieveOfEratosthenes(){
        PrimeAlgo primeAlgo = new SieveOfEratosthenes();
        assertEquals(Arrays.asList(2, 3, 5, 7), primeAlgo.getPrimes(10));
    }
}
