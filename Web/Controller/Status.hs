module Web.Controller.Status where

import Web.Controller.Prelude
import Web.View.Status.Index
import Web.View.Status.New
import Web.View.Status.Edit
import Web.View.Status.Show

instance Controller StatusController where
    action StatusesAction = do
        status <- query @Status |> fetch
        render IndexView { .. }

    action NewStatusAction = do
        let status = newRecord
        render NewView { .. }

    action ShowStatusAction { statusId } = do
        status <- fetch statusId
        render ShowView { .. }

    action EditStatusAction { statusId } = do
        status <- fetch statusId
        render EditView { .. }

    action UpdateStatusAction { statusId } = do
        status <- fetch statusId
        status
            |> buildStatus
            |> ifValid \case
                Left status -> render EditView { .. }
                Right status -> do
                    status <- status |> updateRecord
                    setSuccessMessage "Status updated"
                    redirectTo EditStatusAction { .. }

    action CreateStatusAction = do
        let status = newRecord @Status
        status
            |> buildStatus
            |> ifValid \case
                Left status -> render NewView { .. } 
                Right status -> do
                    status <- status |> createRecord
                    setSuccessMessage "Status created"
                    redirectTo StatusesAction

    action DeleteStatusAction { statusId } = do
        status <- fetch statusId
        deleteRecord status
        setSuccessMessage "Status deleted"
        redirectTo StatusesAction

buildStatus status = status
    |> fill @'["name"]
