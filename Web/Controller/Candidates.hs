module Web.Controller.Candidates where

import Web.Controller.Prelude
import Web.View.Candidates.Index
import Web.View.Candidates.New
import Web.View.Candidates.Edit
import Web.View.Candidates.Show

instance Controller CandidatesController where
    action CandidatesAction = do
        candidates <- query @Candidate |> fetch
        render IndexView { .. }

    action NewCandidateAction = do
        let candidate = newRecord
        render NewView { .. }

    action ShowCandidateAction { candidateId } = do
        candidate <- fetch candidateId
        render ShowView { .. }

    action EditCandidateAction { candidateId } = do
        candidate <- fetch candidateId
        render EditView { .. }

    action UpdateCandidateAction { candidateId } = do
        candidate <- fetch candidateId
        candidate
            |> buildCandidate
            |> ifValid \case
                Left candidate -> render EditView { .. }
                Right candidate -> do
                    candidate <- candidate |> updateRecord
                    setSuccessMessage "Candidate updated"
                    redirectTo EditCandidateAction { .. }

    action CreateCandidateAction = do
        let candidate = newRecord @Candidate
        candidate
            |> buildCandidate
            |> ifValid \case
                Left candidate -> render NewView { .. } 
                Right candidate -> do
                    candidate <- candidate |> createRecord
                    setSuccessMessage "Candidate created"
                    redirectTo CandidatesAction

    action DeleteCandidateAction { candidateId } = do
        candidate <- fetch candidateId
        deleteRecord candidate
        setSuccessMessage "Candidate deleted"
        redirectTo CandidatesAction

buildCandidate candidate = candidate
    |> fill @["name","email","skills","profile","education","city","country","status", "comments", "linkedin","github","englishLevel"]
