if exists("did_load_filetypes") 
	finish 
endif 
augroup filetypedetect 
au! BufRead,BufNewFile *.pc     setfiletype proc 
augroup END 
