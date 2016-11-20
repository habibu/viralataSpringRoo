package com.roo.viralatas.web;
import com.roo.viralatas.domain.Usuarios;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/usuarioses")
@Controller
@RooWebScaffold(path = "usuarioses", formBackingObject = Usuarios.class)
public class UsuariosController {
}
