classdef node < handle
    
    properties
        contenido;
        branch;
        valor;
    end

    methods
        function obj = node(board)
            obj.contenido = board;
            obj.branch(:) = [];
            obj.valor = 0;
        end
        
        function setValor(obj, num)
            obj.valor = num;
        end
        
        function root = getValor(obj)
            root = obj.valor;
        end
        
        function setBranch(obj, nodo, ind)
            obj.branch(ind) = nodo;
        end
        
        function root = getNodeContent(obj)
            root = obj.contenido;
        end
        
        function setNodeContent(obj, board)
            obj.contenido = board;
        end
        
        
    end
end
