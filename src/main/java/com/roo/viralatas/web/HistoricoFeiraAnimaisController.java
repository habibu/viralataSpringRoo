package com.roo.viralatas.web;
import com.roo.viralatas.domain.HistoricoFeiraAnimais;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/historicofeiraanimaises")
@Controller
@RooWebScaffold(path = "historicofeiraanimaises", formBackingObject = HistoricoFeiraAnimais.class)
public class HistoricoFeiraAnimaisController {
}
