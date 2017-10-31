function rob = berechne_dk_positionen_effizient(rob,aktuelles_gelenk,aktueller_zeitschritt)
    % Berechnung der Positions-Groessen der direkten Kinematik (Lage und Orientierung)
    % durch einen effizienten Algorithmus

    %% --- ARBEITSBEREICH: ------------------------------------------------
    % Ergaenzen Sie bitte hier die fehlenden Stellen
    % Ersetzen Sie die nachfolgenden Rueckgaben durch Ihre Berechnungen
    % ---------------------------------------------------------------------
    % Berechnung fuer alle Koerper
    for i = 1:rob.N_Q
        % Index des Vorgaengers merken
        vor = rob.kl(i).vorgaenger;

        % Relativkinematik: Position und Orientierung relativ zum Vorgaenger
        % ------------------------------------------------------------------
        % Homogene Transformationsmatrix vom i-ten Koerper zum Vorgaenger
        % (Bitte nutzen Sie hierfuer auch die Datei dh_trafo.m)
%         rob.kl(i).D_vi = dh_trafo(???,???,???,???)

        % Absolute Position und Orientierung
        % ----------------------------------
        % Homogene Transformationsmatrix vom i ins 0-System
%         rob.kl(i).D_0i = ???

        % Vektor vom Inertialsystem ins i-te KOS im B0-System (aus homogener Transformationsmatrix)
%         rob.kl(i).B0_r_i = ???

        % Rotationsmatrix vom B0 ins Bi-KOS (aus homogener Transformationsmatrix)
%         rob.kl(i).A_i0 = ???
    end
    % Position des Endeffektors im B0-System (aus homogener Transformationsmatrix)
%     rob.w = ???
    %% --- ENDE ARBEITSBEREICH --------------------------------------------
end
