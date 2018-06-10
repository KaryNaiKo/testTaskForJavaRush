package javarush.intership.library.dao;

import javarush.intership.library.model.Book;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BookDAOImpl implements BookDAO {

    private static final Logger logger = LoggerFactory.getLogger(BookDAOImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sf) {
        this.sessionFactory = sf;
    }

    @Override
    public void addBook(Book book) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(book);
        logger.info("Book saved successfully, Book details=" + book);
    }

    @Override
    public void updateBook(Book book) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(book);
        logger.info("Book updated successfully, Book details=" + book);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Book> listBooks() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Book> booksList = session.createQuery("from Book").list();
        for (Book book : booksList) {
            logger.info("Book List::" + book);
        }
        return booksList;
    }

    @Override
    public Book getBookById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Book book = (Book) session.load(Book.class, new Integer(id));
        logger.info("Book loaded successfully, Book details=" + book);
        return book;
    }

    @Override
    public void removeBook(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Book book = (Book) session.load(Book.class, new Integer(id));
        if (null != book) {
            session.delete(book);
        }
        logger.info("Book deleted successfully, Book details=" + book);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Book> findBook(String param) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Book where title like '%" + param + "%'");

        return query.list();
    }
}
