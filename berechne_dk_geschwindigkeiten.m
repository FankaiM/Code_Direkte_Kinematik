function rob = berechne_dk_geschwindigkeiten(rob)
    % Berechnung der Geschwindigkeits-Groessen der direkten Kinematik

    %% --- ARBEITSBEREICH: ------------------------------------------------
    % Ergaenzen Sie bitte hier die fehlenden Stellen
    % Ersetzen Sie die nachfolgenden Rueckgaben durch Ihre Berechnungen
    % ---------------------------------------------------------------------
    % Berechnung fuer alle Koerper
    for i = 1:rob.N_Q
        % Index des Vorgaengers merken
        vor = rob.kl(i).vorgaenger;
        
        %&&&&&& Verschiebungsvektor vom Vorgaenger zum Koerper i im KOS des Vorgaengers (Bv)
        rob.kl(i).Bv_r_vi = [                      rob.kl(i).a;...
                             -sin(rob.kl(i).alpha)*rob.kl(i).d;...
                              cos(rob.kl(i).alpha)*rob.kl(i).d];
        % Relative Winkelgeschwindigkeit berechnen
        % ----------------------------------------
        rob.kl(i).Bi_omega_rel = [0;0;rob.dot_q(i)];

        % Absolute Winkelgeschwindigkeit berechnen
        % ----------------------------------------
       
       rob.kl(i).A_iv = Az(rob.q(i))*Ax(rob.kl(i).alpha);
        %%%%% Drehmatrix vom B0-KOS ins Bi-KOS:
        if(i==1)
            rob.kl(i).A_i0 = rob.kl(i).A_iv;
        else
        rob.kl(i).A_i0 = rob.kl(i).A_iv*rob.kl(i-1).A_i0;%%%%%%
        end
     
        if(i==1)
        rob.kl(i).Bi_omega =rob.kl(i).Bi_omega_rel;
        else
        rob.kl(i).Bi_omega =rob.kl(i).A_iv*rob.kl(i-1).Bi_omega+rob.kl(i).Bi_omega_rel;
        end
        
%          % Initiale Position des TCP im B0-System berechnen:
%          % Hier werden alle q zu Null eingestezt
%         rob.kl(i).D_vi_Init = dh_trafo(rob.kl(i).alpha,rob.kl(i).a,rob.kl(i).d,0);
%         if(i==1)
%         rob.kl(i).D_0i_Init = rob.kl(i).D_vi;
%         else
%         rob.kl(i).D_0i_Init = rob.kl(i-1).D_0i*rob.kl(i).D_vi;
%         end
%         rob.kl(i).B0_r_i_Init= rob.kl(i).D_0i(1:3,4);  
%         rob.kl(i).A_i0_Init =rob.kl(i).D_0i(1:3,1:3)';
        
        % Absolute Translationsgeschwindigkeit berechnen
        % ----------------------------------------------
        if(i==1)
        rob.kl(i).Bi_dot_r_i =[0;0;0];
        else
        rob.kl(i).Bi_dot_r_i = rob.kl(i).A_iv*(rob.kl(i-1).Bi_dot_r_i+tilde(rob.kl(i-1).Bi_omega)*rob.kl(i).Bv_r_vi); 
        end
        
    end

    % Geschwindigkeit des TCP im B0-System berechnen
    rob.dot_w = rob.kl(rob.N_Q).A_i0'*(rob.kl(rob.N_Q).Bi_dot_r_i+tilde(rob.kl(rob.N_Q).Bi_omega)*rob.BN_r_N_tcp);
    %% --- ENDE ARBEITSBEREICH --------------------------------------------
end
