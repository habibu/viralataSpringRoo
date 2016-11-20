package com.roo.viralatas.web;
import com.roo.viralatas.domain.SolicitacaoAdocoes;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/solicitacaoadocoeses")
@Controller
@RooWebScaffold(path = "solicitacaoadocoeses", formBackingObject = SolicitacaoAdocoes.class)
public class SolicitacaoAdocoesController {
}
