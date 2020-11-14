% Programa para el proyecto de Matem�ticas Discretas
% 
% Marco E. Benalc�zar
% marco.benalcazar@epn.edu.ec
% 
clc;
close all;
warning off all;

% A�ade la librer�a para visualizar el tablero del 'tic-tac-toe'
addpath('Toolbox TicTacToe');

% Lista de opciones para el juego:
% -------------------------------------
%
% Opci�n 1: Agente de estudiantes vs. juego manual
% Opci�n 2: Agente del profesor vs. juego manual
% Opci�n 3: Agente de estudiantes vs. agente del profesor
%
% NOTA: En las opciones 2 y 3 se ha inclu�do como agente del profesor uno
%       que realiza movimientos aleatorios. El agente del profesor que realiza
%       movimientos "inteligentes" se pondr� a prueba el d�a de la defensa del
%       del presente proyecto.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           AQU� DEBE CAMBIAR EL VALOR DE LA VARIABLE "OPTION"
%                          
% IMPORTANTE: Colocar el valor de la variable option en 1 cuando
% quiera probar su agente con un usuario; caso contrario, coloque el valor
% en 3 cuando quiera verificar que su programa es capaz de interactuar con
% el agente el profesor. Recuerde que la versi�n del agente implementado por el
% profesor que viene con este c�digo no es la que se usar� el d�a de la defensa del
% presente proyecto.
option = 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tictactoe(option);