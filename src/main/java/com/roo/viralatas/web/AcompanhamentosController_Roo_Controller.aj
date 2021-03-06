// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.roo.viralatas.web;

import com.roo.viralatas.domain.Acompanhamentos;
import com.roo.viralatas.domain.Usuarios;
import com.roo.viralatas.web.AcompanhamentosController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect AcompanhamentosController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String AcompanhamentosController.create(@Valid Acompanhamentos acompanhamentos, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, acompanhamentos);
            return "acompanhamentoses/create";
        }
        uiModel.asMap().clear();
        acompanhamentos.persist();
        return "redirect:/acompanhamentoses/" + encodeUrlPathSegment(acompanhamentos.getIdAcompanhamento().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String AcompanhamentosController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Acompanhamentos());
        return "acompanhamentoses/create";
    }
    
    @RequestMapping(value = "/{idAcompanhamento}", produces = "text/html")
    public String AcompanhamentosController.show(@PathVariable("idAcompanhamento") Integer idAcompanhamento, Model uiModel) {
        uiModel.addAttribute("acompanhamentos", Acompanhamentos.findAcompanhamentos(idAcompanhamento));
        uiModel.addAttribute("itemId", idAcompanhamento);
        return "acompanhamentoses/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String AcompanhamentosController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("acompanhamentoses", Acompanhamentos.findAcompanhamentosEntries(firstResult, sizeNo));
            float nrOfPages = (float) Acompanhamentos.countAcompanhamentoses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("acompanhamentoses", Acompanhamentos.findAllAcompanhamentoses());
        }
        return "acompanhamentoses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String AcompanhamentosController.update(@Valid Acompanhamentos acompanhamentos, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, acompanhamentos);
            return "acompanhamentoses/update";
        }
        uiModel.asMap().clear();
        acompanhamentos.merge();
        return "redirect:/acompanhamentoses/" + encodeUrlPathSegment(acompanhamentos.getIdAcompanhamento().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{idAcompanhamento}", params = "form", produces = "text/html")
    public String AcompanhamentosController.updateForm(@PathVariable("idAcompanhamento") Integer idAcompanhamento, Model uiModel) {
        populateEditForm(uiModel, Acompanhamentos.findAcompanhamentos(idAcompanhamento));
        return "acompanhamentoses/update";
    }
    
    @RequestMapping(value = "/{idAcompanhamento}", method = RequestMethod.DELETE, produces = "text/html")
    public String AcompanhamentosController.delete(@PathVariable("idAcompanhamento") Integer idAcompanhamento, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Acompanhamentos acompanhamentos = Acompanhamentos.findAcompanhamentos(idAcompanhamento);
        acompanhamentos.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/acompanhamentoses";
    }
    
    void AcompanhamentosController.populateEditForm(Model uiModel, Acompanhamentos acompanhamentos) {
        uiModel.addAttribute("acompanhamentos", acompanhamentos);
        uiModel.addAttribute("usuarioses", Usuarios.findAllUsuarioses());
    }
    
    String AcompanhamentosController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
