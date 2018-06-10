package javarush.intership.library.service;

import javarush.intership.library.model.Book;

import java.util.List;

public interface BookService {
    void addBook(Book book);
    void updateBook(Book book);
    List<Book> listBooks();
    Book getBookById(int id);
    void removeBook(int id);
    List<Book> findBook(String param);
}
