package javarush.intership.library.dao;

import javarush.intership.library.model.Book;

import java.util.List;

public interface BookDAO {
    void addBook(Book book);
    void updateBook(Book book);
    List<Book> listBooks();
    Book getBookById(int id);
    void removeBook(int id);
    List<Book> findBook(String param);
}
