// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.roo.viralatas.web;

import com.roo.viralatas.domain.Animais;
import com.roo.viralatas.domain.Feiras;
import com.roo.viralatas.domain.SolicitacaoAdocoes;
import com.roo.viralatas.domain.Status;
import com.roo.viralatas.domain.Usuarios;
import com.roo.viralatas.web.SolicitacaoAdocoesController;
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

privileged aspect SolicitacaoAdocoesController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String SolicitacaoAdocoesController.create(@Valid SolicitacaoAdocoes solicitacaoAdocoes, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, solicitacaoAdocoes);
            return "solicitacaoadocoeses/create";
        }
        uiModel.asMap().clear();
        solicitacaoAdocoes.persist();
        return "redirect:/solicitacaoadocoeses/" + encodeUrlPathSegment(solicitacaoAdocoes.getIdSolicitacaoAdocao().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String SolicitacaoAdocoesController.createForm(Model uiModel) {
        populateEditForm(uiModel, new SolicitacaoAdocoes());
        return "solicitacaoadocoeses/create";
    }
    
    @RequestMapping(value = "/{idSolicitacaoAdocao}", produces = "text/html")
    public String SolicitacaoAdocoesController.show(@PathVariable("idSolicitacaoAdocao") Integer idSolicitacaoAdocao, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("solicitacaoadocoes", SolicitacaoAdocoes.findSolicitacaoAdocoes(idSolicitacaoAdocao));
        uiModel.addAttribute("itemId", idSolicitacaoAdocao);
        return "solicitacaoadocoeses/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String SolicitacaoAdocoesController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("solicitacaoadocoeses", SolicitacaoAdocoes.findSolicitacaoAdocoesEntries(firstResult, sizeNo));
            float nrOfPages = (float) SolicitacaoAdocoes.countSolicitacaoAdocoeses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("solicitacaoadocoeses", SolicitacaoAdocoes.findAllSolicitacaoAdocoeses());
        }
        addDateTimeFormatPatterns(uiModel);
        return "solicitacaoadocoeses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String SolicitacaoAdocoesController.update(@Valid SolicitacaoAdocoes solicitacaoAdocoes, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, solicitacaoAdocoes);
            return "solicitacaoadocoeses/update";
        }
        uiModel.asMap().clear();
        solicitacaoAdocoes.merge();
        return "redirect:/solicitacaoadocoeses/" + encodeUrlPathSegment(solicitacaoAdocoes.getIdSolicitacaoAdocao().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{idSolicitacaoAdocao}", params = "form", produces = "text/html")
    public String SolicitacaoAdocoesController.updateForm(@PathVariable("idSolicitacaoAdocao") Integer idSolicitacaoAdocao, Model uiModel) {
        populateEditForm(uiModel, SolicitacaoAdocoes.findSolicitacaoAdocoes(idSolicitacaoAdocao));
        return "solicitacaoadocoeses/update";
    }
    
    @RequestMapping(value = "/{idSolicitacaoAdocao}", method = RequestMethod.DELETE, produces = "text/html")
    public String SolicitacaoAdocoesController.delete(@PathVariable("idSolicitacaoAdocao") Integer idSolicitacaoAdocao, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        SolicitacaoAdocoes solicitacaoAdocoes = SolicitacaoAdocoes.findSolicitacaoAdocoes(idSolicitacaoAdocao);
        solicitacaoAdocoes.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/solicitacaoadocoeses";
    }
    
    void SolicitacaoAdocoesController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("solicitacaoAdocoes_datasolicitacaoadocao_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void SolicitacaoAdocoesController.populateEditForm(Model uiModel, SolicitacaoAdocoes solicitacaoAdocoes) {
        uiModel.addAttribute("solicitacaoAdocoes", solicitacaoAdocoes);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("animaises", Animais.findAllAnimaises());
        uiModel.addAttribute("feirases", Feiras.findAllFeirases());
        uiModel.addAttribute("statuses", Status.findAllStatuses());
        uiModel.addAttribute("usuarioses", Usuarios.findAllUsuarioses());
    }
    
    String SolicitacaoAdocoesController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
