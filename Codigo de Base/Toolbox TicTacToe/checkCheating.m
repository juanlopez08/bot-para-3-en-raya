function cheating = checkCheating(previousBoard, currentBoard, row, col)
% checkCheating checks if the board was changed in the positions that were
% played already. If a cheat is detected this function returns true,
% otherwise it returns false
%
% Syntaxis:
%
% cheating = checkCheating(previousBoard, currentBoard, row, col)
%
% Inputs:
%
% previousBoard: [3x3] matrix that represents the board before the move we want
%                to check
%  currentBoard: [3x3] matrix that represents the board after the move we want
%                to check
%    (row, col): Denotes the position that was chosen by the agent. The 
%                variables row and col are integers in the interval [1, 3]
%
% outputs:
%
%      cheating: Binary variable, where true indicates that a cheat was detected
%                and false indicates that there was no cheating
%
% Marco E. Benalc�zar, Ph.D.
% marco.benalcazar@epn.edu.ec

previousBoard = previousBoard';
previousBoard = previousBoard(:)';
vect1 = previousBoard(previousBoard ~= 0);

currentBoard(row, col) = 0;
currentBoard = currentBoard';
currentBoard = currentBoard(:)';
vect2 = currentBoard(currentBoard ~= 0);

if isequal(vect1, vect2)
    cheating = false;
else
    cheating = true;
end
return