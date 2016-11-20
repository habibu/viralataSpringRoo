package com.roo.viralatas.web;
import com.roo.viralatas.domain.Cidades;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/cidadeses")
@Controller
@RooWebScaffold(path = "cidadeses", formBackingObject = Cidades.class)
public class CidadesController {
}
