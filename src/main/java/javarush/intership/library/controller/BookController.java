package javarush.intership.library.controller;

import javarush.intership.library.model.Book;
import javarush.intership.library.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import java.util.List;

@Controller
public class BookController {
    private static int MAX_ROWS_PER_PAGE = 10;

    private BookService bookService;

    @Autowired(required=true)
    @Qualifier(value="bookService")
    public void setBookService(BookService bookService){
        this.bookService = bookService;
    }

    @RequestMapping(value = "/books/{page}", method = RequestMethod.GET)
    public String listBooks(@PathVariable("page") Integer page, Model model) {
        List<Book> books = bookService.listBooks();
        PagedListHolder<Book> pagedListHolder = new PagedListHolder<Book>(books);
        pagedListHolder.setPageSize(MAX_ROWS_PER_PAGE);
        model.addAttribute("maxPages", pagedListHolder.getPageCount());

        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
            page=1;
        }

        model.addAttribute("page", page);

        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
            pagedListHolder.setPage(0);
            model.addAttribute("listBooks", pagedListHolder.getPageList());
        }
        else if(page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page-1);
            model.addAttribute("listBooks", pagedListHolder.getPageList());
        }

        return "book";
    }

    //For add and update person both
    @RequestMapping(value= "/book/add", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("book") Book book, @RequestParam("page") String page){

        if(book.getId() == 0){
            //new person, add it
            bookService.addBook(book);
        }else{
            //existing person, call update
            bookService.updateBook(book);
        }

        return "redirect:/books/" + page;
    }

    @RequestMapping("/remove/{id}")
    public String removeBook (@PathVariable("id") int id, @RequestParam("page") String page){

        bookService.removeBook(id);

        return "redirect:/books/" + page;
    }

    @RequestMapping("/edit/{id}")
    public String editBook(@PathVariable("id") int id, Model model, @RequestParam("page") String page){
        Book book = bookService.getBookById(id);
        book.setReadAlready(false);
        model.addAttribute("book", book);
        model.addAttribute("page", page);

        return "bookManipulation";
    }

    @RequestMapping("/toAddBook")
    public String toAddBook(Model model, @RequestParam("page") String page){
        model.addAttribute("book", new Book());
        model.addAttribute("page", page);

        return "bookManipulation";
    }

    @RequestMapping(value = "/find", method = RequestMethod.POST)
    public String findBook (@RequestParam("findParam") String findParam, Model model, @RequestParam("page") Integer page){

        System.out.println("----------------------" + findParam + "-----------------------------");

        List<Book> books = bookService.findBook(findParam);
        PagedListHolder<Book> pagedListHolder = new PagedListHolder<Book>(books);
        pagedListHolder.setPageSize(MAX_ROWS_PER_PAGE);
        model.addAttribute("maxPages", pagedListHolder.getPageCount());

        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
            page=1;
        }

        model.addAttribute("page", page);
        model.addAttribute("findParam", findParam);

        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
            pagedListHolder.setPage(0);
            model.addAttribute("listBooks", pagedListHolder.getPageList());
        }
        else if(page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page-1);
            model.addAttribute("listBooks", pagedListHolder.getPageList());
        }

        return "book";
    }

    @RequestMapping("/read/{id}")
    public String readBook (@PathVariable("id") int id, @RequestParam("page") String page){

        Book book = bookService.getBookById(id);
        book.setReadAlready(true);
        bookService.updateBook(book);

        return "redirect:/books/" + page;
    }
}
