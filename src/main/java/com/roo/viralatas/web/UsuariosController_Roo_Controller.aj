// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.roo.viralatas.web;

import com.roo.viralatas.domain.Acompanhamentos;
import com.roo.viralatas.domain.Adotantes;
import com.roo.viralatas.domain.Enderecos;
import com.roo.viralatas.domain.SolicitacaoAdocoes;
import com.roo.viralatas.domain.Usuarios;
import com.roo.viralatas.web.UsuariosController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect UsuariosController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String UsuariosController.create(@Valid Usuarios usuarios, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, usuarios);
            return "usuarioses/create";
        }
        uiModel.asMap().clear();
        usuarios.persist();
        return "redirect:/usuarioses/" + encodeUrlPathSegment(usuarios.getIdUsuario().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String UsuariosController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Usuarios());
        return "usuarioses/create";
    }
    
    @RequestMapping(value = "/{idUsuario}", produces = "text/html")
    public String UsuariosController.show(@PathVariable("idUsuario") Integer idUsuario, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("usuarios", Usuarios.findUsuarios(idUsuario));
        uiModel.addAttribute("itemId", idUsuario);
        return "usuarioses/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String UsuariosController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("usuarioses", Usuarios.findUsuariosEntries(firstResult, sizeNo));
            float nrOfPages = (float) Usuarios.countUsuarioses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("usuarioses", Usuarios.findAllUsuarioses());
        }
        addDateTimeFormatPatterns(uiModel);
        return "usuarioses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String UsuariosController.update(@Valid Usuarios usuarios, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, usuarios);
            return "usuarioses/update";
        }
        uiModel.asMap().clear();
        usuarios.merge();
        return "redirect:/usuarioses/" + encodeUrlPathSegment(usuarios.getIdUsuario().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{idUsuario}", params = "form", produces = "text/html")
    public String UsuariosController.updateForm(@PathVariable("idUsuario") Integer idUsuario, Model uiModel) {
        populateEditForm(uiModel, Usuarios.findUsuarios(idUsuario));
        return "usuarioses/update";
    }
    
    @RequestMapping(value = "/{idUsuario}", method = RequestMethod.DELETE, produces = "text/html")
    public String UsuariosController.delete(@PathVariable("idUsuario") Integer idUsuario, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Usuarios usuarios = Usuarios.findUsuarios(idUsuario);
        usuarios.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/usuarioses";
    }
    
    void UsuariosController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("usuarios_datanascimento_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void UsuariosController.populateEditForm(Model uiModel, Usuarios usuarios) {
        uiModel.addAttribute("usuarios", usuarios);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("acompanhamentoses", Acompanhamentos.findAllAcompanhamentoses());
        uiModel.addAttribute("adotanteses", Adotantes.findAllAdotanteses());
        uiModel.addAttribute("enderecoses", Enderecos.findAllEnderecoses());
        uiModel.addAttribute("solicitacaoadocoeses", SolicitacaoAdocoes.findAllSolicitacaoAdocoeses());
    }
    
    String UsuariosController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
