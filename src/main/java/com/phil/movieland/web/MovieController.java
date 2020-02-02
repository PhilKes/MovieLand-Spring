package com.phil.movieland.web;

import com.phil.movieland.data.entity.Movie;
import com.phil.movieland.data.entity.Reservation;
import com.phil.movieland.service.MovieService;
import com.phil.movieland.service.MovieShowService;
import com.phil.movieland.service.ReservationService;
import com.phil.movieland.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/movies")
public class MovieController {
    private final MovieService movieService;
    private final MovieShowService movieShowService;

    @Autowired
    public MovieController(MovieService movieService,MovieShowService movieShowService) {
        this.movieService=movieService;
        this.movieShowService=movieShowService;
    }

    @GetMapping
    public String getMovies(
            @RequestParam(value="name",required=false)String search,
            @RequestParam(value="date",required=false)String dateString,
            Model model){
        List<Movie> movies= null;
        if(dateString!=null){
            Date date= DateUtils.createDateFromDateString(dateString);
            System.out.println("Query for "+date);
        }
        if(null==search) {
            System.out.println("No query entered");
            movies=movieService.getAllMovies();
        }else{
            System.out.println("Searched for: "+search);
            movies=movieService.queryAllMovies(search);
        }

       /* Model can be accessed from thymeleaf in .html*/
        model.addAttribute("movies",movies);
        model.addAttribute("showService",movieShowService);
        //model.addAttribute("movieService",movieService);
        return "movies";
    }
}
