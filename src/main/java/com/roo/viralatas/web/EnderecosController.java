package com.roo.viralatas.web;
import com.roo.viralatas.domain.Enderecos;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/enderecoses")
@Controller
@RooWebScaffold(path = "enderecoses", formBackingObject = Enderecos.class)
public class EnderecosController {
}
