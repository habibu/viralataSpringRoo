package com.roo.viralatas.web;
import com.roo.viralatas.domain.Adotantes;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/adotanteses")
@Controller
@RooWebScaffold(path = "adotanteses", formBackingObject = Adotantes.class)
public class AdotantesController {
}
