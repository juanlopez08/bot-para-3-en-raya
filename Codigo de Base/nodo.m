classdef nodo < handle
    
    properties
        contenido;
        rama;
        valor;
    end

    methods
        function obj = nodo(board)
            obj.contenido = board;
            obj.rama(:) = [];
            obj.valor = 0;
        end
        
        function setValor(obj, num)
            obj.valor = num;
        end
        
        function root = getValor(obj)
            root = obj.valor;
        end
        
        function setRama(obj, nodo, ind)
            obj.rama(ind) = nodo;
        end
        
        function root = getNodoContent(obj)
            root = obj.contenido;
        end
        
        function setNodoContent(obj, board)
            obj.contenido = board;
        end
        
        
    end
end
