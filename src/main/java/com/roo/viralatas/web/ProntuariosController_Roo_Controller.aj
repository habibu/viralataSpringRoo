// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.roo.viralatas.web;

import com.roo.viralatas.domain.Animais;
import com.roo.viralatas.domain.Prontuarios;
import com.roo.viralatas.web.ProntuariosController;
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

privileged aspect ProntuariosController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ProntuariosController.create(@Valid Prontuarios prontuarios, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, prontuarios);
            return "prontuarioses/create";
        }
        uiModel.asMap().clear();
        prontuarios.persist();
        return "redirect:/prontuarioses/" + encodeUrlPathSegment(prontuarios.getIdProntuario().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ProntuariosController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Prontuarios());
        return "prontuarioses/create";
    }
    
    @RequestMapping(value = "/{idProntuario}", produces = "text/html")
    public String ProntuariosController.show(@PathVariable("idProntuario") Integer idProntuario, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("prontuarios", Prontuarios.findProntuarios(idProntuario));
        uiModel.addAttribute("itemId", idProntuario);
        return "prontuarioses/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ProntuariosController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("prontuarioses", Prontuarios.findProntuariosEntries(firstResult, sizeNo));
            float nrOfPages = (float) Prontuarios.countProntuarioses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("prontuarioses", Prontuarios.findAllProntuarioses());
        }
        addDateTimeFormatPatterns(uiModel);
        return "prontuarioses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ProntuariosController.update(@Valid Prontuarios prontuarios, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, prontuarios);
            return "prontuarioses/update";
        }
        uiModel.asMap().clear();
        prontuarios.merge();
        return "redirect:/prontuarioses/" + encodeUrlPathSegment(prontuarios.getIdProntuario().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{idProntuario}", params = "form", produces = "text/html")
    public String ProntuariosController.updateForm(@PathVariable("idProntuario") Integer idProntuario, Model uiModel) {
        populateEditForm(uiModel, Prontuarios.findProntuarios(idProntuario));
        return "prontuarioses/update";
    }
    
    @RequestMapping(value = "/{idProntuario}", method = RequestMethod.DELETE, produces = "text/html")
    public String ProntuariosController.delete(@PathVariable("idProntuario") Integer idProntuario, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Prontuarios prontuarios = Prontuarios.findProntuarios(idProntuario);
        prontuarios.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/prontuarioses";
    }
    
    void ProntuariosController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("prontuarios_datacontroleparasitas_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("prontuarios_dataregistro_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void ProntuariosController.populateEditForm(Model uiModel, Prontuarios prontuarios) {
        uiModel.addAttribute("prontuarios", prontuarios);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("animaises", Animais.findAllAnimaises());
    }
    
    String ProntuariosController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
