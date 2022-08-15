package com.api.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BookService {

	@Autowired
	BookRepository bookRepository;
	@Autowired
	WorkController workController;

	public List<Book> getAllBook() {
		return (List<Book>) bookRepository.findAll();
	}

	public Book getBookById(int id) {
		Book book = null;
		try {
//			book = bookRepository.findById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return book;
	}

	public Book addBook(Book book) {
		return bookRepository.save(book);
	}

	/*
	 * deleteById id not founded in database
	 * org.springframework.dao.EmptyResultDataAccessException: No class
	 * com.api.book.Book entity with id 199 exists!
	 */
	public void deleteBook(int id) {
		bookRepository.deleteById(id);
	}

	public Book updateBook(Book book, int id) {
		book.setId(id);
		return bookRepository.save(book);
	}

	public List<Work> essSave(List<Work> workList) {

		return (List<Work>) workController.saveAll(workList);
	}

}
