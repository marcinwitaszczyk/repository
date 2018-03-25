<?php
// src/Controller/MoviesController.php
namespace App\Controller;


use App\Entity\Movies;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityRepository;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use FOS\RestBundle\View\View;
use FOS\RestBundle\Controller\Annotations\Version;
use FOS\RestBundle\Controller\FOSRestController;
use FOS\RestBundle\Controller\Annotations\Post;

use Symfony\Component\Serializer\Serializer;
use Symfony\Component\Serializer\Encoder\XmlEncoder;
use Symfony\Component\Serializer\Encoder\JsonEncoder;
use Symfony\Component\Serializer\Normalizer\ObjectNormalizer;

use Symfony\Component\HttpFoundation\JsonResponse;

//use Doctrine\DBAL\Schema\View;
//use FOS\RestBundle\Controller\Annotations\View;


class MoviesController extends Controller
{

    /**
     * List Api.
     * @Route("/api")
     *
     * @return array
     */
    public function getMoviesApi(Request $request)
    {

        $min_release_date = '2017-01-01 00:00';
        $max_release_date = '2022-01-01 00:00';

        $genre = 'Action';

        $rating = [1,2,3,4,5];

        $sort = 'DESC';

        if ($request->get('min_release_date')) {$min_release_date = $request->get('min_release_date');}
        if ($request->get('max_release_date')) {$max_release_date = $request->get('max_release_date');}

        if ($request->get('genre')) {$genre = $request->get('genre');}

        if ($request->get('rating')) {$rating = $_POST['rating'];}

        if ($request->get('sort')) {$sort = $request->get('sort');}

            $em = $this->getDoctrine()->getManager();


            if ($genre != 'All') { $query = $em->createQuery('SELECT c FROM App:Movies c WHERE c.date_released >= :min_date_released AND c.date_released <= :max_date_released AND c.genre = :genre AND c.rating IN (:rating) ORDER BY c.date_released '.$sort);
            }
            else { $query = $em->createQuery('SELECT c FROM App:Movies c WHERE c.date_released >= :min_date_released AND c.date_released <= :max_date_released AND c.genre != :genre AND c.rating IN (:rating) ORDER BY c.date_released '.$sort);
            }
            $query->setParameters(array(
                'min_date_released' => $min_release_date,
                'max_date_released' => $max_release_date,
                'genre' => $genre,
                'rating' => $rating,
            ));
            $categorias = $query->getArrayResult();

        if ($request->get('responseData') == 'datatable') {


            return $this->render('result.html.twig', array(
                'categories' => $categorias
            ));
        }
        else {
            return new JsonResponse($categorias);
        }

    }
}