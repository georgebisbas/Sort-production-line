% Simple solver for 4-digit array matching using
% swap or rotations
% Used for educational purposes for children 12-15 years old.
% George Bisbas

clc; close all; clear all;

solved = 1; % flag for not solved

while solved==1
 clc;
    x = randi(2, 1, 6); % x holds our actions 1 for swap, 2 for rotate
    pins = [1 2 3 4];   % Starting positions
    npins = [4 3 2 1];  % Desired positions


    i = 1;
    %  Ensure that no 2 consecutive swaps exist
    flag2 = 1;
    while flag2
        i = i + 1;
        if (x(i - 1) == 1)
            x(i) = 2;
        else
            x(i) = randi(2);
        end

        if (i == 6)
            flag2 = 0;
        end

    end
    %fprintf("no 2 x 1 's' in order ");
    %x % Validate pass

    for i = 1:6
        if x(i) == 1
            [pins(1) pins(2)] = deal(pins(2), pins(1)); % swap

        else % rotate

            temp = pins(4);
            for j = 3:-1:1
                pins(j+1) = pins(j);
            end
            pins(1) = temp;
        end
        disp(pins);

        if (pins == npins)
           disp("CORRECT");
           MOVES = i;
           solved = 0; % solved
           break

        end
    end


        if (pins ~= npins)
            solved = 1;
        end
end

disp("solution");
disp(x(1:MOVES));
