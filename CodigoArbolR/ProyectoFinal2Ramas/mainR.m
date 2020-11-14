% Programa para el proyecto de Matemáticas Discretas
% 
% Marco E. Benalcázar
% marco.benalcazar@epn.edu.ec
% 
clc;
close all;
warning off all;

% Añade la librería para visualizar el tablero del 'tic-tac-toe'
addpath('Toolbox TicTacToe');

% Lista de opciones para el juego:
% -------------------------------------
%
% Opción 1: Agente de estudiantes vs. juego manual
% Opción 2: Agente del profesor vs. juego manual
% Opción 3: Agente de estudiantes vs. agente del profesor
%
% NOTA: En las opciones 2 y 3 se ha incluído como agente del profesor uno
%       que realiza movimientos aleatorios. El agente del profesor que realiza
%       movimientos "inteligentes" se pondrá a prueba el día de la defensa del
%       del presente proyecto.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           AQUÍ DEBE CAMBIAR EL VALOR DE LA VARIABLE "OPTION"
%                          
% IMPORTANTE: Colocar el valor de la variable option en 1 cuando
% quiera probar su agente con un usuario; caso contrario, coloque el valor
% en 3 cuando quiera verificar que su programa es capaz de interactuar con
% el agente el profesor. Recuerde que la versión del agente implementado por el
% profesor que viene con este código no es la que se usará el día de la defensa del
% presente proyecto.
option = 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tictactoe(option);