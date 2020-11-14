classdef arbol < handle

    properties
        raiz;
       
    end
    
    

    methods
       
        function obj = arbol()
            obj.raiz = nodo(zeros(3,3));
        end
        
        function raiz = getRaiz(arbol)
            raiz = arbol.raiz;
        end
        
        function crearRaiz(obj, board)
            obj.raiz = nodo(board);
            obj.raiz.rama = nodo([]);
        end
        
        function crearArbolNivel1(obj, board)
            contador = 1;
            for i=1:3
                for j=1:3
                    board2 = board;
                    if(board(i,j)==0)
                        board2(i,j) = 1;
                        obj.raiz.rama(contador) = nodo(board2);
                        obj.raiz.rama(contador).rama = nodo([]);
                        contador = contador + 1;
                    end
                end
            end
        end
        
        function crearArbolNivel2(obj, board, ind)
            contador = 1;
            for i=1:3
                for j=1:3
                    board2 = board;
                    if(board(i,j)==0)
                        board2(i,j) = 2;
                        obj.raiz.rama(ind).rama(contador) = nodo(board2);
                        contador = contador + 1;
                    end
                end
            end
        end
        
        function [row, col] = MejorJugada(arbol, avalaiblePositions)
            fds = 0;
            jugadaMin = zeros(3,3);
            jugadaMax = zeros(3,3);
            min = 111;
            max = -111;
            Nmax = 0;
            Nmin = 0;          
            
            
            board = arbol.raiz.contenido;
            
                 if((board(2,2)==2 && board(1,1)==1) && board(3,3)==2 && board(1,2)==0 && board(1,3)==0 && board(2,1)==0 && board(2,3)==0 && board(3,2)==0)
  row=3;
 col=1;
   return
    end 
            
                  
            
            for i=1:numel(arbol.raiz.rama)
          %      Para que siempre que este disponible, escoja el centro.
                for m=1:numel(avalaiblePositions)
                   if(avalaiblePositions(m)==5)
                      row = 2;
                      col = 2;
                      return
                   end
                end
                
           %     Para que si queda solo una posicion, la escoja.
                if(numel(avalaiblePositions) == 1)
                    for m=1:3
                        for n=1:3
                            if(arbol.raiz.contenido(m,n)==0)
                                row = m;
                                col = n;
                                return
                            end
                        end
                    end
                end
                

                for j=1:numel(arbol.raiz.rama(i).rama)
                    jugadaMin = arbol.raiz.rama(i).rama(j).contenido;
                    for k=1:3
                       %Se calcula el numero de filas y columnas que min
                       %puede llegar a ocupar para ganar
                       %recorre en filas
                       if((jugadaMin(k,1)==2||jugadaMin(k,1)==0) && (jugadaMin(k,2)==2||jugadaMin(k,2)==0) && (jugadaMin(k,3)==2||jugadaMin(k,3)==0))
                           Nmin = Nmin + 1;
                           
                       end
  
                       if((jugadaMin(1,k)==2||jugadaMin(1,k)==0) && (jugadaMin(2,k)==2||jugadaMin(2,k)==0) && (jugadaMin(3,k)==2||jugadaMin(3,k)==0))
                           Nmin = Nmin + 1;
                           
                       end
                       %Se calcula el numero de filas y columnas que max
                       %puede llegar a ocupar para ganar
                       %recorre en columnas
                       if((jugadaMin(k,1)==1||jugadaMin(k,1)==0) && (jugadaMin(k,2)==1||jugadaMin(k,2)==0) && (jugadaMin(k,3)==1||jugadaMin(k,3)==0))
                           Nmax = Nmax + 1;
                           
                       end
                       if((jugadaMin(1,k)==1||jugadaMin(1,k)==0) && (jugadaMin(2,k)==1||jugadaMin(2,k)==0) && (jugadaMin(3,k)==1||jugadaMin(3,k)==0))
                           Nmax = Nmax + 1;
                          
                       end
                       if(jugadaMin(k,1)==1 && jugadaMin(k,2)==1 && jugadaMin(k,3)==1)
                           Nmax = Nmax + 111;
                           
                       end
                       if(jugadaMin(1,k)==1 && jugadaMin(2,k)==1 && jugadaMin(3,k)==1)
                           Nmax = Nmax + 111;
                          
                       end
                    end
                       %Se calcula si min puede llegar ocupar las diagonales
                       if((jugadaMin(1,1)==2||jugadaMin(1,1)==0) && (jugadaMin(2,2)==2||jugadaMin(2,2)==0) && (jugadaMin(3,3)==2||jugadaMin(3,3)==0))
                           Nmin = Nmin + 1;
                       end
                       if((jugadaMin(1,3)==2||jugadaMin(1,3)==0) && (jugadaMin(2,2)==2||jugadaMin(2,2)==0) && (jugadaMin(3,1)==2||jugadaMin(3,1)==0))
                           Nmin = Nmin + 1;
                       end
                       %Se calcula si max puede llegar ocupar las diagonales
                       if((jugadaMin(1,1)==1||jugadaMin(1,1)==0) && (jugadaMin(2,2)==1||jugadaMin(2,2)==0) && (jugadaMin(3,3)==1||jugadaMin(3,3)==0))
                           Nmax = Nmax + 1;
                       end
                       if((jugadaMin(1,3)==1||jugadaMin(1,3)==0) && (jugadaMin(2,2)==1||jugadaMin(2,2)==0) && (jugadaMin(3,1)==1||jugadaMin(3,1)==0))
                           Nmax = Nmax + 1;
                       end
                       if(jugadaMin(1,1)==1 && jugadaMin(2,2)==1 && jugadaMin(3,3)==1)
                           Nmax = Nmax + 111;
                       end
                       if(jugadaMin(1,3)==1 && jugadaMin(2,2)==1 && jugadaMin(3,1)==1)
                           Nmax = Nmax + 111;
                       end
                       fds = Nmax - Nmin;
                       arbol.raiz.rama(i).rama(j).setValor(fds);
                       fds = 0;
                       Nmax = 0;
                       Nmin = 0;
                end
                %%%%%%%%%%%%%%%%%%%%%%%%%%%
               
                 
              %  SI MINIMAX DEVUELVE DOS VALORES DE HOJAS IGUALES ENTRA A
              %  VALIDAR 
%               SI HAY DOS EN FILA Y ELIGE LA MEJOR
               for k=1:3
                if((board(k,1)==0 && board(k,2)==1) &&  board(k,3)==1 )
                    disp('1 libre 23 ocupada por 1');
                   row = k;
                   col = 1;
                   return
                   end
               end
                for k=1:3
                 if((board(k,1)==0 && board(k,2)==2) &&  board(k,3)==2 )
                    disp('1 libre 23 ocupada por 2');
                   row = k;
                   col = 1;
                   return
                   end
                end
                for k=1:3
                 if((board(k,1)==1 && board(k,2)==0) &&  board(k,3)==1 )
                    disp('2 libre 13 ocupada por 1');
                   row = k;
                   col = 2;
                   return
                   end
                end
               for k=1:3
                 if((board(k,1)==2 && board(k,2)==0) &&  board(k,3)==2 )
                    disp('2 libre 13 ocupada por 2');
                   row = k;
                   col = 2;
                   return
                   end
                end
                
                for k=1:3
                 if((board(k,1)==1 && board(k,2)==1) &&  board(k,3)==0 )
                    disp('3 libre 12 ocupada por 1');
                   row = k;
                   col = 3;
                   return
                   end
                end
                for k=1:3
                 if((board(k,1)==2 && board(k,2)==2) &&  board(k,3)==0 )
                    disp('3 libre 12 ocupada por 2');
                   row = k;
                   col = 3;
                   return
                   end
                end
                
              %  SI MINIMAX DEVUELVE DOS VALORES DE HOJAS IGUALES ENTRA A
              %  VALIDAR 
              %  SI HAY DOS EN FILA Y ELIGE LA MEJOR

              if((board(1,3)==2 && board(2,2)==1) && board(3,1)==2 && board(1,1)==0 && board(2,1)==0 && board(2,1)==0 && board(2,3)==0 && board(3,3)==0)
                  row=3;
                  col=2;
                  return
              end 
              
              for k=1:3
                 if((board(1,k)==0 && board(2,k)==1) &&  board(3,k)==1 )
                    disp('1 libre 23 ocupada por 1 col');
                   row = 1;
                   col = k;
                   return
                   end
              end
                
              for k=1:3
                 if((board(1,k)==0 && board(2,k)==2) &&  board(3,k)==2 )
                    disp('1 libre 23 ocupada por 2 col');
                   row = 1;
                   col = k;
                   return
                   end
              end
                for k=1:3
                 if((board(1,k)==1 && board(2,k)==0) &&  board(3,k)==1 )
                    disp('2 libre 13 ocupada por 1 col');
                   row = 2;
                   col = k;
                   return
                   end
                end
                for k=1:3
                 if((board(1,k)==2 && board(2,k)==0) &&  board(3,k)==2 )
                    disp('2 libre 13 ocupada por 2 col');
                   row = 2;
                   col = k;
                   return
                   end
                end
               for k=1:3
                 if((board(1,k)==1 && board(2,k)==1) &&  board(3,k)==0 )
                    disp('3 libre 12 ocupada por 1 col');
                   row = 3;
                   col = k;
                   return
                   end
               end
                 for k=1:3
                 if((board(1,k)==2 && board(2,k)==2) &&  board(3,k)==0 )
                    disp('3 libre 12 ocupada por 2 col');
                   row = 3;
                   col = k;
                   return
                   end
                end
              
           % validar diagonal principal
            if((board(1,1)==1 && board(2,2)==1 && board(3,3)==0))
                disp('3 libre diagonal 12 por 1');
                row = 3;
                col = 3;
                return
            end
             if((board(1,1)==2 && board(2,2)==2 && board(3,3)==0))
                disp('3 libre diagonal 12 por 2');
                row = 3;
                col = 3;
                return
             end
            if((board(1,1)==1 && board(2,2)==0 && board(3,3)==1))
                disp('2 libre diagonal 13 por 1');
                row = 2;
                col = 2;
                return
            end
            if((board(1,1)==2 && board(2,2)==0 && board(3,3)==2))
                disp('2 libre diagonal 13 por 2');
                row = 2;
                col = 2;
                return
            end
            if((board(1,1)==0 && board(2,2)==1 && board(3,3)==1))
                disp('1 libre diagonal 23 por 1');
                row = 1;
                col = 1;
                return
            end
            if((board(1,1)==0 && board(2,2)==2 && board(3,3)==2))
                disp('1 libre diagonal 23 por 2');
                row = 1;
                col = 1;
                return
            end
        
            %validar diagonal secundaria
            if((board(1,3)==1 && board(2,2)==1 && board(3,1)==0))
                disp('3 libre diag inv 12 por 1');
                row = 3;
                col = 1;
                return
            end
             if((board(1,3)==2 && board(2,2)==2 && board(3,1)==0))
                disp('3 libre diag inv 12 por 2');
                row = 3;
                col = 1;
                return
             end
             if((board(1,3)==1 && board(2,2)==0 && board(3,1)==1))
                disp('2 libre diag inv 13 por 1');
                row = 2;
                col = 2;
                return
            end
            if((board(1,3)==2 && board(2,2)==0 && board(3,1)==2))
                disp('2 libre diag inv 13 por 2');
                row = 2;
                col = 2;
                return
            end
            if((board(1,3)==0 && board(2,2)==1 && board(3,1)==1))
                disp('2 libre diag inv 13 por 1');
                row = 1;
                col = 3;
                return
            end
             if((board(1,3)==0 && board(2,2)==2 && board(3,1)==2))
                disp('2 libre diag inv 13 por 2');
                row = 1;
                col = 3;
                return
            end
                
                
                %%%%%%%%%%%%%%%%%%%%%%%% FIN VALIDACION SECUNDARIA
                for m=1:numel(arbol.raiz.rama(i).rama)
                    if(arbol.raiz.rama(i).rama(m).getValor < min)
                        min = arbol.raiz.rama(i).rama(m).getValor;
                    end
                end
                arbol.raiz.rama(i).setValor(min);
        end
            
            for i=1:numel(arbol.raiz.rama)
                if(arbol.raiz.rama(i).getValor >= max)
                    max = arbol.raiz.rama(i).getValor;
                    jugadaMax = arbol.raiz.rama(i).contenido;               
                end
            end
            
            arbol.raiz.setValor(max);
            
            for i=1:3
                for j=1:3
                    if(arbol.raiz.contenido(i,j) ~= jugadaMax(i,j))
                        row = i;
                        col = j;
                        return
                    end
                end
            end
        end  
    end
end
