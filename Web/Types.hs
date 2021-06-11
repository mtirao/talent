module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data CandidatesController
    = CandidatesAction
    | NewCandidateAction
    | ShowCandidateAction { candidateId :: !(Id Candidate) }
    | CreateCandidateAction
    | EditCandidateAction { candidateId :: !(Id Candidate) }
    | UpdateCandidateAction { candidateId :: !(Id Candidate) }
    | DeleteCandidateAction { candidateId :: !(Id Candidate) }
    | FilterCandidatesAction {candidatesState :: !(Text)}
    deriving (Eq, Show, Data)

data StatusController
    = StatusesAction
    | NewStatusAction
    | ShowStatusAction { statusId :: !(Id Status) }
    | CreateStatusAction
    | EditStatusAction { statusId :: !(Id Status) }
    | UpdateStatusAction { statusId :: !(Id Status) }
    | DeleteStatusAction { statusId :: !(Id Status) }
    deriving (Eq, Show, Data)
