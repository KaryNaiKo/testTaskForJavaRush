package javarush.intership.library.service;

import javarush.intership.library.dao.BookDAO;
import javarush.intership.library.model.Book;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    private BookDAO bookDAO;

    public void setBookDAO(BookDAO bookDAO) {
        this.bookDAO = bookDAO;
    }

    @Override
    @Transactional
    public void addBook(Book book) {
        bookDAO.addBook(book);
    }

    @Override
    @Transactional
    public void updateBook(Book book) {
        bookDAO.updateBook(book);
    }

    @Override
    @Transactional
    public List<Book> listBooks() {
        return bookDAO.listBooks();
    }

    @Override
    @Transactional
    public Book getBookById(int id) {
        return bookDAO.getBookById(id);
    }

    @Override
    @Transactional
    public void removeBook(int id) {
        bookDAO.removeBook(id);
    }

    @Override
    @Transactional
    public List<Book> findBook(String param) {
        return bookDAO.findBook(param);
    }
}
