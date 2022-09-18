package com.example.onlinestore.entites;

import com.example.onlinestore.services.ProductWithImageAddRequestService;
import org.junit.jupiter.api.Test;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

public class ProductWIthImageRequestTest {
    private ProductWithImageAddRequestService productWithImageAddRequestService(){
        return mock(ProductWithImageAddRequestService.class);
    }

    @Test
    public void productWithImageRequestIdOrder() throws NoSuchFieldException, IllegalAccessException{
        ProductWithImageAddRequestService pwis = productWithImageAddRequestService();
        List<ProductWithImageAddRequest> pwil = new ArrayList<>();
        when(pwis.getPool()).thenReturn(new ArrayList<>(){
            {
                Field pwiIdField = ProductWithImageAddRequest.class.getDeclaredField("id");
                pwiIdField.setAccessible(true);
                ProductWithImageAddRequest pwi1 = new ProductWithImageAddRequest(new Product(), 1, new User(), new ArrayList<>());
                pwiIdField.set(pwi1, 0l);
                this.add(pwi1);
                ProductWithImageAddRequest pwi2 = new ProductWithImageAddRequest(new Product(), 1, new User(), new ArrayList<>());
                pwiIdField.set(pwi2, 1l);
                this.add(pwi2);
            }
        });
        ProductWithImageAddRequest pwi = new ProductWithImageAddRequest(new Product(), 1, new User(), pwis.getPool());
        assertEquals(2, pwi.getId());
    }
}
