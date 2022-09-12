package com.example.onlinestore.services;

import com.example.onlinestore.entites.Cart;
import com.example.onlinestore.entites.CartProduct;
import com.example.onlinestore.entites.Product;
import com.example.onlinestore.entites.User;
import com.example.onlinestore.repositories.CartRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class CartService {
    private final CartRepository cartRepository;
    private final CartProductService cartProductService;

    public void createCart(User user){
        Cart cart = new Cart();
        cartRepository.save(cart);
        cart.setUser(user);
        cartRepository.save(cart);
    }

    public void addProduct(Product p, User user){
        Cart cart = user.getCart();
        log.info("called addProduct() method from CartService");

        //Проверка на наличие товара в корзине
        for(CartProduct cp: cart.getProducts()){
            if (cp.getProduct() == p){
                cp.setQuantity(cp.getQuantity() + 1);
                cartProductService.save(cp);
                return;
            }
        }
        // Если в корзине нет объекта типа CartProduct с таким объектом - создаем его
        CartProduct cp = CartProduct.builder().product(p).quantity(1).build();
        cart.getProducts().add(cp);
        cartProductService.save(cp);
        return;
    }

    public void removeProduct(Product p, User u){
        Cart cart = u.getCart();
        CartProduct cp = cart.getProducts()
                .stream().filter(a -> a.getProduct().equals(p))
                .findFirst()
                .orElseThrow(() -> new RuntimeException());
        cart.getProducts().remove(cp);
        return;
    }

    public void decreaseQuantity(Product p, User u){
        Cart cart = u.getCart();
        CartProduct cp = cart.getProducts()
                .stream()
                .filter(x -> x.getProduct().equals(p))
                .findFirst()
                .orElseThrow(() -> new RuntimeException());
        cp.decreaseQuantity();
    }

    public void increaseQuantity(Product p, User u){
        Cart cart = u.getCart();
        CartProduct cp = cart.getProducts()
                .stream()
                .filter(x -> x.getProduct().equals(p))
                .findFirst()
                .orElseThrow(() -> new RuntimeException());
        cp.increaseQuantity();
    }

    public void setProductQuantity(Product p, User u, int quantity){
        Cart cart = u.getCart();
        CartProduct cp = cart.getProducts()
                .stream()
                .filter(x -> x.getProduct().equals(p))
                .findFirst()
                .orElseThrow(() -> new RuntimeException());
        cp.setQuantity(quantity);
    }


    public void saveCart(Cart cart){
        cartRepository.save(cart);
    }

    public void flushCart(){
        cartRepository.flush();
    }

    public void setUserId(Long cartId, Long userId){
        //cartRepository.setUserId(cartId, userId);
    }
}
