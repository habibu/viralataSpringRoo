package com.roo.viralatas.web;
import com.roo.viralatas.domain.Situacoes;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/situacoeses")
@Controller
@RooWebScaffold(path = "situacoeses", formBackingObject = Situacoes.class)
public class SituacoesController {
}
