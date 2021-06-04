module Web.View.Status.Index where
import Web.View.Prelude

data IndexView = IndexView { status :: [Status] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={StatusesAction}>Statuses</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewStatusAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Status</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach status renderStatus}</tbody>
            </table>
        </div>
    |]


renderStatus :: Status -> Html
renderStatus status = [hsx|
    <tr>
        <td>{(get #name status)}</td>
        <td><a href={ShowStatusAction (get #id status)}>Show</a></td>
        <td><a href={EditStatusAction (get #id status)} class="text-muted">Edit</a></td>
        <td><a href={DeleteStatusAction (get #id status)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
