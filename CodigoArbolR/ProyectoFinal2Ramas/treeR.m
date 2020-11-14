classdef tree < handle

    properties
        root;
    end

    methods
        function obj = tree()
            obj.root = node(zeros(3,3));
        end
        
        function root = getRoot(tree)
            root = tree.root;
        end
        
        function llenarRaiz(obj, board)
            obj.root = node(board);
            obj.root.branch = node([]);
        end
        
        function llenarArbolNivel1(obj, board)
            contador = 1;
            for i=1:3
                for j=1:3
                    board2 = board;
                    if(board(i,j)==0)
                        board2(i,j) = 1;
                        obj.root.branch(contador) = node(board2);
                        obj.root.branch(contador).branch = node([]);
                        contador = contador + 1;
                    end
                end
            end
        end
        
        function llenarArbolNivel2(obj, board, ind)
            contador = 1;
            for i=1:3
                for j=1:3
                    board2 = board;
                    if(board(i,j)==0)
                        board2(i,j) = 2;
                        obj.root.branch(ind).branch(contador) = node(board2);
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
            
            for i=1:numel(arbol.root.branch)
                %Para que siempre que este disponible, escoja el centro.
                for m=1:numel(avalaiblePositions)
                   if(avalaiblePositions(m)==5)
                      row = 2;
                      col = 2;
                      return
                   end
                end
                
                %Para que si queda solo una posicion, la escoja.
                if(numel(avalaiblePositions) == 1)
                    for m=1:3
                        for n=1:3
                            if(arbol.root.contenido(m,n)==0)
                                row = m;
                                col = n;
                                return
                            end
                        end
                    end
                end
                
%                 fila=0;
%                 columna=0;
%                 agente=1;
%                 [fila, columna] = validacionDosEnRaya(arbol.root.contenido, agente);
%                 if (~isequals([fila,columna],[0,0]))
%                     row = fila;
%                     col = columna;
%                 end
%                 agente=2;
%                 [fila, columna] = validacionDosEnRaya(arbol.root.contenido, agente);
%                 if (~isequals([fila,columna],[0,0]))
%                     row = fila;
%                     col = columna;
%                 end
            board = arbol.root.contenido;
            agente = 1;
            for k=1:3
                %recorre en filas
                if((board(k,1)==agente && board(k,2)==agente) &&  board(k,3)==0)
                    disp('entra1');
                   row = k;
                   col = 3;
                   return
                end
                if ((board(k,2)==agente && jugadaMin(k,3)==agente) && board(k,1)==0)
                    disp('entra2');
                    row = k;
                    col = 1;
                    return
                end
                if ((board(k,1)==agente && board(k,3)==agente) && board(k,2)==0)
                    disp('entra3');
                    row = k;
                    col = 2;
                    return
                end
                %recorre en columnas
                if((board(1,k)==agente && board(2,k)==agente) &&  board(3,k)==0) 
                   disp('entra4');
                   row = 3;
                   col = k;
                   return
                end
                if ((board(2,k)==agente && jugadaMin(3,k)==agente) && board(1,k)==0)
                    disp('entra5');
                    row = 1;
                    col = k;
                    return
                end
                if ((board(1,k)==agente && board(3,k)==agente) && board(2,k)==0)
                    disp('entra6');
                    row = 2;
                    col = k;
                    return
                end
            end
            %validar diagonal principal
            if((board(1,1)==agente && board(2,2)==agente && board(3,3)==0))
                disp('entra7');
                row = 3;
                col = 3;
                return
            end
            if((board(1,1)==agente && board(2,2)==0 && board(3,3)==agente))
                disp('entra8');
                row = 2;
                col = 2;
                return
            end
            if((board(1,1)==0 && board(2,2)==agente && board(3,3)==agente))
                disp('entra9');
                row = 1;
                col = 1;
                return
            end
            %validar diagonal secundaria
            if((board(1,3)==agente && board(2,2)==agente && board(3,1)==0))
                disp('entra10');
                row = 3;
                col = 1;
                return
            end
            if((board(1,3)==agente && board(2,2)==0 && board(3,1)==agente))
                disp('entra11');
                row = 2;
                col = 2;
                return
            end
            if((board(1,3)==0 && board(2,2)==agente && board(3,1)==agente))
                disp('entra12');
                row = 1;
                col = 3;
                return
            end

                for j=1:numel(arbol.root.branch(i).branch)
                    jugadaMin = arbol.root.branch(i).branch(j).contenido;
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
                       arbol.root.branch(i).branch(j).setValor(fds);
                       fds = 0;
                       Nmax = 0;
                       Nmin = 0;
                end
                
                for m=1:numel(arbol.root.branch(i).branch)
                    if(arbol.root.branch(i).branch(m).getValor < min)
                        min = arbol.root.branch(i).branch(m).getValor;
                    end
                end
                arbol.root.branch(i).setValor(min);
            end
            
            for i=1:numel(arbol.root.branch)
                if(arbol.root.branch(i).getValor >= max)
                    max = arbol.root.branch(i).getValor;
                    jugadaMax = arbol.root.branch(i).contenido;               
                end
            end
            
            arbol.root.setValor(max);
            
            for i=1:3
                for j=1:3
                    if(arbol.root.contenido(i,j) ~= jugadaMax(i,j))
                        row = i;
                        col = j;
                        return
                    end
                end
            end
        end      
    end
end
