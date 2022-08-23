package com.api.book;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

@org.springframework.stereotype.Controller
public class Controller {

	@Autowired
	BookService bookService;
	
	

	@GetMapping("/books")
	public ResponseEntity<List<Book>> getBooks() {
		List<Book> list = bookService.getAllBook();
		if (list.size() <= 0) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
		}
//		return ResponseEntity.of(Optional.of(list));
		return ResponseEntity.status(HttpStatus.OK).body(list);

	}

	@GetMapping("/books/{id}")
	public ResponseEntity<Book> getBook(@PathVariable("id") int id) {
		Book book = bookService.getBookById(id);
		if (book == null) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
		}
		return ResponseEntity.of(Optional.of(book));
	}

	@PostMapping("/books")
	public ResponseEntity<Book> saveBook(@RequestBody Book book) {
		return ResponseEntity.of(Optional.of(bookService.addBook(book)));
	}
	@PostMapping("/ess")
	public ResponseEntity<List<Work>> saveEss(@RequestBody List<Work>  work) {
//		return ResponseEntity.of(Optional.of(work));
//		return ResponseEntity.status(HttpStatus.OK).body(work);
		return ResponseEntity.of(Optional.of(bookService.essSave(work)));
		
	}

	@DeleteMapping("/books/{id}")
	public ResponseEntity<Object> deleteBook(@PathVariable int id) {
		try {
			bookService.deleteBook(id);
//			return ResponseEntity.status(HttpStatus.NO_CONTENT)
			return ResponseEntity.status(HttpStatus.OK).body("Delete Successully");
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
		}
	}

	@PutMapping("/books/{id}")
	public ResponseEntity<Book> updateBook(@RequestBody Book book, @PathVariable int id) {
		return ResponseEntity.of(Optional.of(bookService.updateBook(book, id)));
	}

}
