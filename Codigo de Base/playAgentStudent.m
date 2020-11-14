function [row, col] = playAgentStudent(board)
% playAgentStudent implementa un agente que juega el 'tic-tac-toe' usando
% �rboles.
%
% Entradas:
%
%         - board: [3x3] matriz conteniendo el estado actual del juego.
%                  Cada posici�n de esta matriz contiene un elemento del 
%                  conjunto {0, 1, 2}. La codificaci�n es la siguiente:
%                  0 = posici�n disponible
%                  1 = posici�n ocupada por el agente del estudiante
%                  2 = posici�n ocupada por el agente del profesor o el
%                      agente manual
% Salidas:
%
%           - row: [1x1] entero del conjunto {1, 2, 3} que indica la fila donde
%                  el agente del estudiante ha colocado la marca actual
%           - col: [1x1] entero del conjunto {1, 2, 3} que indica la columna donde
%                  el agente del estudiante ha colocado la marca actual
%
% Matem�ticas Discretas
% Marco E. Benalc�zar
% marco.benalcazar@epn.edu.ec

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        COLOCAR AQU� SU C�DIGO DEL AGENTE QUE JUEGA TIC-TAC-TOE
%
% El siguiente c�digo es �nicamente ilustrativo. Debe modificar el c�digo
% que sigue de tal manera de implementar un agente que juegue el 'tic-tac-toe'
% usando �rboles.
%
% NOTA: modificar �nicamente el contenido que sigue. Si modifica otras
% partes del c�digo, es posible que el programa no funcione correctamente.
% Si desea puede crear funciones que son invocadas desde dentro de esta
% funci�n. De lo contrario, puede programar toda la funcionalidad de su
% agente dentro de la presente funci�n.

pause(0.7);
board = board';
board = board(:)';
% Encuentra las posiciones que no han sido ocupadas por ning�n jugador
vector = 1:9;
availablePositions = vector(board == 0);


%SE DECLARA LA MATRIZ COMO UN VECTOR DE 0 - 9 PARA LAS POSICIONES
mesa(1,1) = board(1);
mesa(1,2) = board(2);
mesa(1,3) = board(3);
mesa(2,1) = board(4);
mesa(2,2) = board(5);
mesa(2,3) = board(6);
mesa(3,1) = board(7);
mesa(3,2) = board(8);
mesa(3,3) = board(9);

a = arbol();
a.crearRaiz(mesa)
a.crearArbolNivel1(mesa)

for i=1:numel(a.raiz.rama)
   a.crearArbolNivel2(a.raiz.rama(i).contenido, i);
end







% CODIGO ALEATORIO SUMINISTRADO EN EL BASE
% % Selecciona aleatoriamente una posici�n vac�a
% [dummy, idx] = sort(  rand( size(availablePositions) )  );
% [col, row] = ind2sub(  [3 3], availablePositions( idx(1) )  );
[row, col] = MejorJugada(a, availablePositions);
clear a;

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
return